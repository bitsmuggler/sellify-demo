workspace {

    model {

        backoffice = person "Backoffice" {
            description "Internal staff for authoring and reviewing"
        }

        sellify = softwareSystem "Sellify" {
            description "Central system for product management and sales"
        }

        companyShop = softwareSystem "Existing Shop System" "" "Existing System" {
            description "Existing shop system for placing and selling products"
        }

        paymentGateway = softwareSystem "Payment Gateway" "" "Existing System" {
            description "Handles payment processing for sales"
        }

        privateSeller = person "Private Seller" {
            description "Private individuals who manage products"
        }

        buyer = person "Buyer" {
            description "Customer of the online shop"
        }

        external = softwareSystem "External Shops" "" "Existing System" {
            description "Companies that import and manage products"
        }

        external -> sellify "Onboarding, import products, manage products"
        backoffice -> sellify "Authoring and reviewing"
        privateSeller -> sellify "Onboarding, manage products"
        sellify -> companyShop "Place products"
        companyShop -> sellify "Report sales"
        sellify -> paymentGateway "Payment, sales"
        buyer -> companyShop "Shopping"
    }

    views {
        systemContext "sellify" {
            include *
            autolayout rl
        }
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}