import bb.cascades 1.2
import custom 1.0

Page {
    id: detailPage
    property variant detailData: undefined
    onDetailDataChanged: {
        //listView.dataModel.insert(0, detailData);
        if (detailData.condition == "rain") weatherView.weatherType = WeatherType.WTRaining;
        else if (detailData.condition == "foggy") weatherView.weatherType = WeatherType.WTFoggy;
        else if (detailData.condition == "cloudy") weatherView.weatherType = WeatherType.WTCloudy;
        else if (detailData.condition == "darkcloudy") weatherView.weatherType = WeatherType.WTDarkCloudy;
        else weatherView.weatherType = WeatherType.WTClear
    }
    
    titleBar: TitleBar {
        visibility: ChromeVisibility.Visible
        title: detailData.Flightnumber
    }
    Container {
        layout: StackLayout {
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            
            }
            leftPadding: 15.0
            WeatherView {
                id: weatherView
                preferredWidth: 400
                preferredHeight: 400
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Bottom
                text: detailData.carrier
                textStyle.fontSizeValue: 30.5
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Bottom
                text: "Gate : " + detailData.hall
                textStyle.fontSizeValue: 30.5
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Bottom
                text: "Schedule : " + detailData.scheduled
                textStyle.fontSizeValue: 30.5
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Bottom
                text: "To : " + detailData.airport
                textStyle.fontSizeValue: 30.5
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Bottom
                text: "Status : " + detailData.status
                textStyle.fontSizeValue: 30.5
            }
        }
    }
}
