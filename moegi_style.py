from pygments.style import Style
from pygments.token import (
    Keyword, Name, Comment, String, Error, Number,
    Operator, Generic, Whitespace, Punctuation, Text,
)


class MoegiLightStyle(Style):
    name = "moegilight"
    background_color = "#FAFAF6"
    default_style = ""

    KEYWORD = "#AD4033"
    NUMBER = "#C97B3D"
    STRING = "#8A8C3E"
    TEXT = "#3B3B33"
    MUTED = "#8A8F7A"

    styles = {
        Whitespace: "#cccccc",

        Comment: f"italic {MUTED}",
        Comment.Preproc: "noitalic",
        Comment.Special: "bold",

        Keyword: f"bold {KEYWORD}",
        Keyword.Pseudo: "nobold",
        Keyword.Type: f"nobold {KEYWORD}",

        Operator: TEXT,
        Operator.Word: f"bold {KEYWORD}",

        Punctuation: TEXT,

        Name: TEXT,
        Name.Builtin: TEXT,
        Name.Builtin.Pseudo: TEXT,
        Name.Function: TEXT,
        Name.Function.Magic: f"italic {TEXT}",
        Name.Class: f"bold {TEXT}",
        Name.Namespace: f"bold {TEXT}",
        Name.Exception: f"bold {KEYWORD}",
        Name.Variable: TEXT,
        Name.Variable.Magic: f"italic {TEXT}",
        Name.Constant: NUMBER,
        Name.Label: f"bold {TEXT}",
        Name.Entity: f"bold {TEXT}",
        Name.Attribute: TEXT,
        Name.Tag: f"bold {KEYWORD}",
        Name.Decorator: f"bold {NUMBER}",

        String: STRING,
        String.Doc: "italic",
        String.Interpol: f"bold {STRING}",
        String.Escape: f"bold {NUMBER}",
        String.Regex: STRING,
        String.Symbol: STRING,
        String.Other: STRING,
        String.Affix: f"bold {KEYWORD}",

        Number: NUMBER,

        Generic.Heading: f"bold {TEXT}",
        Generic.Subheading: f"bold {TEXT}",
        Generic.Deleted: KEYWORD,
        Generic.Inserted: STRING,
        Generic.Error: KEYWORD,
        Generic.Emph: "italic",
        Generic.Strong: "bold",
        Generic.Prompt: f"bold {MUTED}",
        Generic.Output: TEXT,
        Generic.Traceback: KEYWORD,

        Error: f"border:{KEYWORD}",

        Text: TEXT,
    }

MoegilightStyle = MoegiLightStyle
