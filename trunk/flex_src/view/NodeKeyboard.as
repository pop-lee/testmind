// ActionScript file
import flash.events.KeyboardEvent;
import flash.events.TextEvent;

private var _ctrlKeyDown : Boolean = false;

private function keyDownHandle(event : KeyboardEvent) : void
{
    if(event.ctrlKey)
        _ctrlKeyDown = true;
}

private function keyUpHandle(event : KeyboardEvent) : void
{
    if(mainModel.focusNode == this) {
        if(event.ctrlKey&&event.keyCode == 13) {
            event.stopPropagation();
            this.isEditable = false;
        }
    }
    _ctrlKeyDown = false;
}

private function textInputHandle(event : TextEvent) : void
{
    if(event.text == "\n"&&_ctrlKeyDown)
        event.preventDefault();
}