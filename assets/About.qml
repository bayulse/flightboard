import bb.cascades 1.2

NavigationPane {
    id: navPane
    //property alias test: listView
    
    Page {
        titleBar: TitleBar {
            visibility: ChromeVisibility.Visible
            title: "About"
        }
        Container {
            layout: DockLayout {
            }
            ImageView {
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                imageSource: "asset:///images/sky_bg.png"
                
                leftMargin: 0.0
                topMargin: 0.0
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                
                }
                verticalAlignment: VerticalAlignment.Top
                leftPadding: 15.0
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 15.0
                Label {
                    text: "FlightBoard Version 1.0"
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    multiline: true
                    text: "This application brings the flight information arrivals, departures and airport weather."
                }
                Label {
                    text: "To make you easier to get the information."
                }
                Label {
                    text: "<html>By : <a href=\"https://facebook.com/bayu.laksana\">Bayu LSE</a></html>"
                    horizontalAlignment: HorizontalAlignment.Center
                
                }
            
            }
        }
    }
}
