// Default empty project template
import bb.cascades 1.2

TabbedPane {
    showTabsOnActionBar: true
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Departures") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icons/depart.png"
        content: Departures{}
    } //End of first tab
    Tab {
        title: qsTr("Arrivals") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icons/arrival.png"
        content: Arrivals{}
    }
    Tab {
        title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icons/icon_info.png"
        content: About{}
    }

}
