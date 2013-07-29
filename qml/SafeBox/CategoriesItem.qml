// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id:itemRectangle
    width: 300
    height: 80
    color: "#2DB8B7"
    border.color: "green"
    border.width: 2

    property alias text: showText.text
    property alias image: icomImage
    property alias color: itemRectangle.color

    property string tableName: ""
    property string showName: showText.text
    property string data1: ""
    property string data2: ""
    property string data3: ""
    property string data4: ""
    property string data5: ""
    property string data6: ""
    property string data7: ""
    property string data8: ""

    signal moreRectangleClicked()
    signal itemClicked()


    Image {
        id: icomImage
        x: 7
        y: 9
        width: 53
        height: 59
//        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Text {
        id: showText
        x: 66
        y: 9
        width: 174
        height: 59
        text: qsTr("")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Rectangle {
        id: moreRectangle
        x: 250
        y: 9
        width: 41
        height: 59
        color: "#A20013"

        Image {
            id: moreIcomImage
            x: 7
            y: 9
            width: 41
            height: 59
//            source: "qrc:/qtquickplugin/images/template_image.png"
        }
    }
}
