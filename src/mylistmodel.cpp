/*
 * mylistmodel.cpp
 *
 *  Created on: Sep 5, 2013
 *      Author: Sridhar
 */

// List with context menu project template
#include "mylistmodel.hpp"

#include <bb/data/JsonDataAccess>

using namespace bb::cascades;

// Creating a QVariantList type provided by QListDataModel
MyListModel::MyListModel(QObject* parent)
: bb::cascades::QVariantListDataModel()
{
    qDebug() << "Creating MyListModel object:" << this;

    setParent(parent);
}

MyListModel::~MyListModel()
{
    qDebug() << "Destroying MyListModel object:" << this;
}

void MyListModel::load(const QString& file_name)
{
	// reads and parse json data coming from a file to QVariantList
    bb::data::JsonDataAccess jda;
    QVariantList lst = jda.load(file_name).value<QVariantList>();

    // Successfully reading the data, append the QVariant values into ListDataModel
    if (jda.hasError()) {
        bb::data::DataAccessError error = jda.error();
        qDebug() << file_name << "JSON loading error: " << error.errorType() << ": " << error.errorMessage();
    }
    else {
        qDebug() << file_name << "JSON data loaded OK!";
        append(lst);
    }
}

QVariant MyListModel::value(int ix, const QString &fld_name)
{
    QVariant ret;

    // model data are organized in a list of dictionaries
    if(ix >= 0 && ix < size()) {
        // get dictionary on index
        QVariantMap curr_val = QVariantListDataModel::value(ix).toMap();
        ret = curr_val.value(fld_name);
    }

    return ret;
}

void MyListModel::setValue(int ix, const QString& fld_name, const QVariant& val)
{
    // model data are organized in a list of dictionaries
    if(ix >= 0 && ix < size()) {
    	// get dictionary on index
        QVariantMap curr_val = QVariantListDataModel::value(ix).value<QVariantMap>();

        // set dictionary value for key fld_name
        curr_val[fld_name] = val;

        // replace updated dictionary in array
        replace(ix, curr_val);
    }
}

QString MyListModel::itemType(const QVariantList &indexPath) {
    if (indexPath.length() == 1 && indexPath.value(0).toInt(NULL) == 0) {
        return QString::null;
    } else {
        return QString::null;
    }
}
