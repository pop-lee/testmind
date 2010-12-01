package library.line
{
    import flash.geom.Point;
    
    import mx.binding.utils.ChangeWatcher;
    import mx.core.UIComponent;

    public class LinkLine extends UIComponent
    {
        
        [Bindable]
        private var _startPoint : Point = new Point();
        [Bindable]
        private var _endPoint : Point = new Point();
        
        private var _lineColor : uint = 0x000000;
        
        public function set startPoint(_startPoint : Point) : void
        {
            this._startPoint = _startPoint;
        }
        public function set endPoint(_endPoint : Point) : void
        {
            this._endPoint = _endPoint;
        }
        
        public function LinkLine()//startPoint : Point= null,endPoint : Point= null)
        {
//            this.addEventListener("pointMoveEvent",drawLine);
//            _startPoint = startPoint;
//            _endPoint = endPoint;
            super();
//            drawLine();
        }
        
        //画线
        public function drawLine(event : Event= null):void{
            this.graphics.clear();
            this.graphics.lineStyle(2,_lineColor);
            this.graphics.moveTo(_startPoint.x,_startPoint.y);
            this.graphics.lineTo(_endPoint.x,_endPoint.y);
        }
    }
}