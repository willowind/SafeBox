// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:categoriesRectangle
    width: 320
    height: 400

    ListModel {
        id:categoriesListModel

        ListElement {
            icon: "icon"
            name: "name"
        }

        ListElement {
            icon: "icon-1"
            name: "name-1"
        }

        ListElement {
            icon: "icon-1"
            name: "name-1"
        }
    }

    Component {
        id:categoriesDelegate
        CategoriesItem {
            id:item
            text: name
        }
    }

    ListView {
        id:categoriesListView
        model: categoriesListModel
        delegate: categoriesDelegate
    }
}
