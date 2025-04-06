workspace {

    model {
    
        backoffice = person "Backoffice" {
            description "Interne Mitarbeitende für Authoring und Prüfung"
        }


        sellify = softwareSystem "Sellify" {
            description "Zentrales System zum Produktmanagement und Verkauf"
        }
    
        companyShop = softwareSystem "Bestehendes Shopsystem" "" "Existing System" {
            description "Vorhandenes Shopsystem zur Platzierung und zum Verkauf von Produkten"
        }

        paymentGateway = softwareSystem "Payment Gateway" "" "Existing System" {
            description "Zahlungsabwicklung für Verkäufe"
        }

        privateSeller = person "Private Verkäufer" {
            description "Privatpersonen, die Produkte onboarden und verwalten"
        }
        
        buyer = person "Käufer" {
            description "Kunde des Online-Shops"
        }
        
        
        external = softwareSystem "Externe Shops" "" "Existing System" {
            description "Firmen, die Produkte importieren und verwalten"
        }

        external -> sellify "Onboarding, Produkte importieren, Produkte verwalten"

        backoffice -> sellify "Authoring und Prüfung"
        privateSeller -> sellify "Onboarding, Produkte verwalten"
        sellify -> companyShop "Produkte platzieren"
        companyShop -> sellify "Produkte verkauft"
        sellify -> paymentGateway "Bezahlung, Verkauf"
        buyer -> companyShop "Einkaufen"
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

