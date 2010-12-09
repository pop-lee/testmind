
package model
{
    import mx.core.Application;
    
    import view.Node;
    
    public class MindModel
    {
        [Bindable]
        public static var _mainModel : MindModel ;
        
//        public var _treeData : XMLListCollection = new XMLListCollection();
        
        [Bindable]
//        public static var levelPositionMap : IMap = new HashMap();
        
        [Bindable]
        public var nodeSpacing : int = 20;
        
        public var main : Application ;
        
        public var dragNode : Node ;
        
        public var focusNode : Node ;
        
        public var isDraging : Boolean = false;
        
        [Bindable]
        public var parentSpacing : int = 40;
        
        public static function getInstance() : MindModel
        {
            if(_mainModel == null) {
                _mainModel = new MindModel();
            }
            return _mainModel;
        }
        
        
        public function MindModel()
        {
            if(_mainModel != null) {
                throw new Error("this is a singleton model");
            }
        }

    }
}