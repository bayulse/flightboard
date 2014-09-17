import bb.cascades 1.2
import custom 1.0

NavigationPane {
    id: navPane

    Page {
        id: page

        titleBar: TitleBar {
            title: "Departures"
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

            ListView {
                id: listView
                objectName: "listView"

                dataModel: MyListModel {
                    id: myListModel
                }
                property int activeItem: -1

                function pushFlightDetailPage(indexPath) {
                    var p = flightDetailsPageDefinition.createObject()
                    var selectedItemData = dataModel.data(indexPath);
                    p.detailData = selectedItemData
                    navPane.push(p);
                }

                // Override default GroupDataModel::itemType() behaviour, which is to return item type "header"
                listItemComponents: [
                    // define delegates for different item types here
                    ListItemComponent {
                        // StandardListItem is a convivience component for lists with default cascades look and feel
                        StandardListItem {
                            title: ListItemData.Flightnumber + "\t\t\t" + ListItemData.airport
                            description: ListItemData.scheduled + " | Gate: " + ListItemData.hall
                            status: ListItemData.status
                        }
                    }
                ]

                onTriggered: {
                    pushFlightDetailPage(indexPath);
                    //console.log("onActivationChanged, active: " + active)
                    //if (active) listView.activeItem = indexPath[0]
                }
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1.0
                }
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill

            }
            attachedObjects: [
                ComponentDefinition {
                    id: flightDetailsPageDefinition
                    FlightDetailScreen {
                    }
                }
            ]
            onCreationCompleted: {
                // populate list view model with the sample data
                myListModel.load("app/native/assets/departures.json")
            }
            // ListView
        } // Container

    } // Page

    onPopTransitionEnded: {
        page.destroy() // <- Destroy Page Object that was just
    }
}