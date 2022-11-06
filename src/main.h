#if __cplusplus
#define EXTERN_C extern "C"
#else
#define EXTERN_C
#endif

typedef enum ComponentKind {
    Component_Text,
    Component_Column
} ComponentKind;

typedef union Element {
    struct Text *text;
    struct Column *column;
} Element;

typedef struct ChildComponent {
    ComponentKind kind;
    Element element;
    struct ChildComponent *next;
} ChildComponent;

typedef struct Text {
    char *text;
} Text;

typedef struct Column {
    ChildComponent *first;
} Column;

typedef struct Component {
    ComponentKind kind;
    Element element;
} Component;

EXTERN_C Component *build();
