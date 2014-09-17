/*
 * WeatherType.hpp
 *
 *  Created on: 2012-09-28
 *      Author: bslack
 */

#ifndef WEATHERTYPE_HPP_
#define WEATHERTYPE_HPP_

#include <QObject>

class WeatherType : public QObject {
	Q_OBJECT
    Q_ENUMS(WTWeather)

public:
    enum WTWeather { WTClear, WTRaining, WTCloudy, WTDarkCloudy, WTFoggy } ;
};

class WeatherTime : public QObject {
	Q_OBJECT
    Q_ENUMS(WTTime)
public:
    enum WTTime { WTDaytime, WTNighttime } ;

};

#endif /* WEATHERTYPE_HPP_ */
