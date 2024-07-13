
#Global
#Only set to true if infrastructure is vk8s in XC
vk8s = false
xc_project_prefix = "demo"

#XC Global
api_url = "https://treino.console.ves.volterra.io/api"
xc_tenant = "treino-ufahspac"
xc_namespace = "demo"

#XC LB
app_domain = "sbm.f5-hyd-xcdemo.com"

#XC WAF
xc_waf_blocking = true

#XC Azure CE site creation
az_ce_site = "false"

#XC Service Discovery
xc_service_discovery = "false"

# pool and LB inputs
k8s_pool = "true"
serviceName = "crapi-web.crapi"
serviceport = "80"
advertise_sites = "false"
http_only = "false"
xc_delegation = "false"
ip_address_on_site_pool = "false"

#XC AI/ML Settings for MUD, APIP - NOTE: Only set if using AI/ML settings from the shared namespace
xc_app_type = []
xc_multi_lb = false

#XC API Protection and Discovery
xc_api_disc = true
xc_api_pro = true
xc_api_spec = ["https://treino.console.ves.volterra.io/api/object_store/namespaces/demo/stored_objects/swagger/crapi-swagger/v1-24-06-25"]
#Enable API schema validation
xc_api_val = true
#Enable API schema validation on all endpoints
xc_api_val_all = true
#Validation properties for request and response validation
xc_api_val_properties = ["PROPERTY_QUERY_PARAMETERS", "PROPERTY_PATH_PARAMETERS", "PROPERTY_CONTENT_TYPE", "PROPERTY_COOKIE_PARAMETERS", "PROPERTY_HTTP_HEADERS", "PROPERTY_HTTP_BODY"]#Example ["PROPERTY_QUERY_PARAMETERS", "PROPERTY_PATH_PARAMETERS", "PROPERTY_CONTENT_TYPE", "PROPERTY_COOKIE_PARAMETERS", "PROPERTY_HTTP_HEADERS", "PROPERTY_HTTP_BODY"]
xc_resp_val_properties = [] #Example ["PROPERTY_HTTP_HEADERS", "PROPERTY_CONTENT_TYPE", "PROPERTY_HTTP_BODY", "PROPERTY_RESPONSE_CODE"]
#Validation Mode active for requests and responses (false = skip)
xc_api_val_active = true
xc_resp_val_active = false
#Validation Enforment Type (only one of these should be set to true)
enforcement_block = false
enforcement_report = true
#Allow access to unprotected endpoints 
fall_through_mode_allow = false
#Enable API Validation custom rules
xc_api_val_custom = false 

#XC Bot Defense
xc_bot_def = false

#XC DDoS
xc_ddos_pro = false

#XC Malicious User Detection
xc_mud = false

# CE configs
gcp_ce_site = "false"
aws_ce_site = "false"
site_name = "test-api-ce"

# infra (Needed values: aws-infra, azure-infra, gcp-infra, set based on workspace name)
aws   = ""
azure = ""
gcp   = ""

eks_ce_site = "true"

user_site = "true"
