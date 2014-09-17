import bb.cascades 1.2
import custom 1.0

Container {
    id: weatherDisplayContainerID

    property int weatherType: undefined
    property int timeOfDay: undefined
    property int animate: 1
        onWeatherTypeChanged: {
            var newVisible = true;
            switch(weatherType) {
                 case WeatherType.WTCloudy:
                     weatherView.imageSource = "asset:///images/Weather/lightcloud.png";
                     break;
                 case WeatherType.WTDarkCloudy:
                     weatherView.imageSource = "asset:///images/Weather/darkcloud.png";
                     break;
                 case WeatherType.WTFoggy:
                     weatherView.imageSource = "asset:///images/Weather/fog.png";
                     break;
                 case WeatherType.WTRaining:
                     weatherView.imageSource = "asset:///images/Weather/raincloud.png";
                     break;
                 case WeatherType.WTClear:                     
                 default:
                     newVisible = false;
                     //weatherView.visible = false;
            }
            weatherView.visible = newVisible;   
        }
        
        
        onTimeOfDayChanged: {
            console.log("Time of Day Changed");
            switch(timeOfDay) {
                case WeatherTime.WTNighttime:
                    
                    solarView.imageSource = "asset:///images/SolarBody/moon.png";
                    break;
                case WeatherTime.WTDaytime:                    
                default:
                    
                     solarView.imageSource = "asset:///images/SolarBody/sun.png";
                
            }
            
        }
        
        onAnimateChanged: {
            weatherView.translationX = - (weatherDisplayContainerID.preferredWidth * 0.15);
            if(animate) forwardTranslationAnimation.play();
        }
    
    layout: DockLayout {
    }
    ImageView {
        id: solarView
        imageSource: "asset:///images/SolarBody/sun.png"
        preferredWidth: weatherDisplayContainerID.preferredHeight
        preferredHeight: weatherDisplayContainerID.preferredHeight
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        scalingMethod: ScalingMethod.AspectFit
    }
    ImageView {
        id: weatherView
        visible: false
        opacity: 0.75
        imageSource: "asset:///images/Weather/lightcloud.png"
        preferredHeight: weatherDisplayContainerID.preferredHeight
        preferredWidth: weatherDisplayContainerID.preferredHeight
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        animations: [
            TranslateTransition {
                id: forwardTranslationAnimation
                toX: weatherView.translationX + (weatherDisplayContainerID.preferredWidth * 0.15)
                easingCurve: StockCurve.QuadraticInOut
                duration: 5000
                onEnded: {
                    if(animate) backwardTranslationAnimation.play();
                }
            },
            TranslateTransition {
                id: backwardTranslationAnimation
                toX: weatherView.translationX - (weatherDisplayContainerID.preferredWidth * 0.15)
                easingCurve: StockCurve.QuadraticInOut
                duration: 5000
                onEnded: {
                    if(animate) forwardTranslationAnimation.play();
                }
            }
        ]
        onCreationCompleted: {
            weatherView.translationX = - (weatherDisplayContainerID.preferredWidth * 0.15);
            if(animate) forwardTranslationAnimation.play();
        }
        scalingMethod: ScalingMethod.AspectFit
    }
}
