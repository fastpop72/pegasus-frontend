import QtQuick 2.0


Rectangle {
    width: parent.width
    height: 55
    color: "#ff4035"

    PathView {
        model: 30
        delegate: platformCardDelegate

        path: Path {
            startX: -400
            startY: 20

            PathAttribute { name: "itemZ"; value: 201 }
            PathAttribute { name: "itemScale"; value: 1.2 }
            PathLine { x: 220; y: 20 }

            PathPercent { value: 0.04 }
            PathAttribute { name: "itemZ"; value: 200 }
            PathAttribute { name: "itemScale"; value: 1.2 }
            PathLine { x: 300; y: 20 }

            PathPercent { value: 0.08 }
            PathAttribute { name: "itemScale"; value: 1 }
            PathLine { x: parent.width; y: 20 }

            PathPercent { value: 1 }
            PathAttribute { name: "itemZ"; value: 5 }
            PathAttribute { name: "itemScale"; value: 1 }
        }

        pathItemCount: 24

        snapMode: PathView.SnapOneItem
        preferredHighlightBegin: 0.04
        preferredHighlightEnd: 0.05

        focus: true
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onLeftPressed: decrementCurrentIndex()
    }

    Component {
        id: platformCardDelegate

        PlatformCard {
            text: modelData
            visible: PathView.onPath
            z: PathView.itemZ
            scale: PathView.itemScale
        }
    }
}
