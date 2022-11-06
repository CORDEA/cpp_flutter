#include "main.h"

ChildComponent *buildText(const char *raw_text) {
    auto text = new Text{.text = raw_text};
    auto component = new ChildComponent{
            .kind = Component_Text,
            .element = {.text = text}
    };
    return component;
}

Component *build() {
    auto first = buildText("first");
    auto second = buildText("second");
    first->next = second;
    auto column = new Column{.first = first};
    auto root = new Component{
            .kind = Component_Column,
            .element = {.column = column}
    };
    return root;
}
