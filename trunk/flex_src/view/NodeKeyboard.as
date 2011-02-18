// ActionScript file
import flash.events.KeyboardEvent;
import flash.events.TextEvent;

private function keyUpHandle(event : KeyboardEvent) : void
{
    if(mainModel.focusNode == this&&this.isEditable) {
        if(event.ctrlKey&&event.keyCode == 13) {
            event.stopPropagation();
            this.isEditable = false;
        }
    }
    mainModel.ctrlKeyDown = false;
}

private function textInputHandle(event : TextEvent) : void
{
    if(event.text == "\n"&&mainModel.ctrlKeyDown)
        event.preventDefault();
}