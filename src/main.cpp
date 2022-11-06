#include <cstring>
#include "main.h"

int main() {
    build();
    return 0;
}

ChildComponent *buildText(const char *raw_text) {
    auto text = new Text{.text = raw_text};
    auto component = new ChildComponent{
            .kind = Component_Text,
            .element = {.text = text}
    };
    return component;
}

ChildComponent *buildTile(const char *raw_title, const char *raw_subtitle) {
    auto tile = new Tile{.title = buildText(raw_title)};
    if (strlen(raw_subtitle) > 0) {
        tile->subtitle = buildText(raw_subtitle);
    }
    return new ChildComponent {
        .kind = Component_Tile,
        .element = {.tile = tile}
    };
}

Component *build() {
    auto first = buildTile("first", "");
    auto second = buildTile("second", "second");
    first->next = second;
    auto column = new Column{.first = first};
    auto root = new Component{
            .kind = Component_Column,
            .element = {.column = column}
    };
    return root;
}
