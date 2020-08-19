#include <sys/ioctl.h>
#include <net/if.h>
#include <arpa/inet.h>
#include <err.h>
#include <netinet/ether.h>
#include <net/ethernet.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <string.h>
// #include <linux/if_arp.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>

#include <stdint.h>
// #include <stdlib.h>
// #include <sys/socket.h>
// #include <unistd.h>

#include <pcap/pcap.h>

int minn(int a, int b) {
  return a < b ? a : b;
}

uint16_t in_cksum(uint8_t* addr, size_t len) {
  uint32_t res = 0;

  while (len > 1) {
    res += *(uint16_t*)addr;
    addr += 2;
    len -= 2;
  }
  if (len == 1) {
    res += *addr;
  }
  res = (res >> 16) + (res & 0xffff);
  res += res >> 16;
  return (uint16_t)~res;
}

int main(int argc, char* argv[]) {
  // TODO(ji): use gflags instead!
  const char* interface_name = argv[1];
  const char* dst_mac_address = argv[2];
  struct sockaddr_in interface_address;
  struct sockaddr_ll sll;
  sll.sll_family = AF_PACKET;
  sll.sll_protocol = htons(ETH_P_IP);
  sll.sll_halen = 6;
  int sd = socket(AF_PACKET, SOCK_RAW, ETH_P_ALL);
  if (sd < 0) {
    err(1, "socket");
  }
  struct ifreq ifr;

  memcpy(ifr.ifr_name, interface_name, IFNAMSIZ);
  // For future reference
  if (ioctl(sd, SIOCGIFINDEX, &ifr) < 0) {
    err(1, "SIOCGIFINDEX");
  }
  sll.sll_ifindex = ifr.ifr_ifindex;

  // per netdevice(7):
  // For compatibility, only AF_INET addresses are accepted or returned.
  if (ioctl(sd, SIOCGIFADDR, &ifr) < 0) {
    err(1, "SIOCGIFADDR");
  }
  interface_address = *(struct sockaddr_in*)&ifr.ifr_addr;
  fprintf(stderr, "%d %08x\n",
          interface_address.sin_family,
          ntohl(interface_address.sin_addr.s_addr));
  if (ioctl(sd, SIOCGIFHWADDR, &ifr) < 0) {
    err(1, "SIOCGIFHWADDR");
  }
  fprintf(stderr, "%d %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx\n",
          ifr.ifr_addr.sa_family,
          ifr.ifr_addr.sa_data[0],
          ifr.ifr_addr.sa_data[1],
          ifr.ifr_addr.sa_data[2],
          ifr.ifr_addr.sa_data[3],
          ifr.ifr_addr.sa_data[4],
          ifr.ifr_addr.sa_data[5]);
  memcpy(&sll.sll_addr, ifr.ifr_addr.sa_data, 6);

  struct icmp_packet {
    struct ether_header eth;
    struct ip ip;
    struct icmp icmp;
    uint8_t payload[56];
  }  __attribute__ ((__packed__));
  struct icmp_packet p;
  memcpy((void*)&p.eth.ether_dhost, (void*)ether_aton(dst_mac_address), 6);
  memcpy((void*)&p.eth.ether_shost, (void*)&ifr.ifr_addr.sa_data, 6);
  p.eth.ether_type = htons(ETH_P_IP);
  p.ip.ip_v = 4;
  p.ip.ip_hl = 5;
  p.ip.ip_tos = 0x00;
  p.ip.ip_len = htons(sizeof(p) - sizeof(p.eth));
  p.ip.ip_id = 0x5555;
  p.ip.ip_off = 0;
  p.ip.ip_ttl = 255;
  p.ip.ip_p = IPPROTO_ICMP;
  p.ip.ip_sum = 0;
  p.ip.ip_src.s_addr = interface_address.sin_addr.s_addr;
  p.ip.ip_dst.s_addr = htonl(0xc0a806ff);
  p.ip.ip_sum = in_cksum((uint8_t*)&p.ip, 20);
  p.icmp.icmp_type = ICMP_ECHO;
  p.icmp.icmp_code = 0;
  p.icmp.icmp_id = 42;
  p.icmp.icmp_seq = 1;
  p.icmp.icmp_cksum = 0;
  p.icmp.icmp_cksum = in_cksum((uint8_t*)&p.icmp, sizeof(struct icmp) + 56);

  if (sendto(sd, (caddr_t)&p, sizeof(p), 0, (struct sockaddr*)&sll, sizeof(sll)) != sizeof(p)) {
    err(1, "send");
  }

  // int fd = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_IP));
  // if (fd < 0) {
  //   err(1, "AF_PACKET");
  // }
  // struct sockaddr_ll bcast = {
  //   AF_PACKET,
  //   htons(ETH_P_IP),
  //   2,
  //   htons(ARPHRD_ETHER),
  //   0,
  //   6,
  //   {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0, 0, },
  // };



}
