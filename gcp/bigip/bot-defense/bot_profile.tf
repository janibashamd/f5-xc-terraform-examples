provider "bigip" {
    address = local.bigip_ip
    username = "admin"
    password = local.bigip_password
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
