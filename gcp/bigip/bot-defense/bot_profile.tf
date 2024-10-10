provider "bigip" {
    address               = local.bigip_ip
    username              = "admin"
    password              = local.bigip_password
    port                  = "8443"
}

resource "bigip_ltm_monitor" "monitor" {
  name                    = "/Common/terraform_monitor"
  parent                  = "/Common/http"
}

resource "bigip_ltm_node" "node" {
  name                    = "/Common/terraform_node1"
  address                 = local.app_ip
  connection_limit        = "0"
  dynamic_ratio           = "1"
  monitor                 = "/Common/icmp"
  description             = "Terraform-Node"
  rate_limit              = "disabled"
  fqdn {
    address_family        = "ipv4"
    interval              = "3000"
  }
}

resource "bigip_ltm_pool" "pool" {
  name                      = "/Common/terraform_Pool"
  load_balancing_mode       = "round-robin"
  minimum_active_members    = 1
  monitors                  = [bigip_ltm_monitor.monitor.name]
}

resource "bigip_ltm_pool_attachment" "attach_node" {
  pool                      = bigip_ltm_pool.pool.name
  node                      = "${bigip_ltm_node.node.name}:80"
}

resource "bigip_ltm_virtual_server" "http" {
  name                       = "/Common/terraform_vs"
  destination                = local.bigip_private
  description                = "VirtualServer-terraform"
  port                       = 80
  pool                       = bigip_ltm_pool.pool.name
  profiles                   = ["/Common/tcp", "/Common/http"]
  source_address_translation = "automap"
  translate_address          = "enabled"
  translate_port             = "enabled"
}


#resource "bigip_as3" "as3-example1" {
#  as3_json    = file("as3.json")
#  tenant_name = "Test"
#}
#
#resource "bigip_ltm_policy" "test-policy" {
#    name = "/Common/test-policy"
#    strategy = "first-match"
#    requires = ["http"]
#    controls = ["forwarding"]
#    rule {
#        name = "rule6"
#        action {
#            tm_name = "20"
#            forward = true
#            pool = "/Common/mypool"
#        }
#    }
#    depends_on = [bigip_ltm_pool.mypool]
#}
#
#resource "bigip_ltm_pool" "mypool" {
#    name = "/Common/mypool"
#    monitors = ["/Common/http"]
#    allow_nat = "yes"
#    allow_snat = "yes"
#    load_balancing_mode = "round-robin"
#}
#
#
#resource "bigip_ltm_profile_bot_defense" "test-bot-tc1" {
#  name          = "/Common/test-bot-tc1"
#  defaults_from = "/Common/bot-defense"
#  description   = "test-bot"
#  template      = "relaxed"
#}
#
