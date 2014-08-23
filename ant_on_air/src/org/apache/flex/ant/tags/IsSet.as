////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.ant.tags
{
    import mx.core.IFlexModuleFactory;
    
    import org.apache.flex.ant.Ant;
    import org.apache.flex.ant.tags.supportClasses.IValueTagHandler;
    import org.apache.flex.ant.tags.supportClasses.TagHandler;
    
    [Mixin]
    public class IsSet extends TagHandler implements IValueTagHandler
    {
        public static function init(mf:IFlexModuleFactory):void
        {
            Ant.antTagProcessors["isset"] = IsSet;
        }

        public function IsSet()
        {
            super();
        }
        
        private function get property():String
		{
			return getNullOrAttributeValue("@property");
		}
        
        public function getValue(context:Object):Object
        {
			this.context = context;
			if (property == null) return false;
            
            return context.hasOwnProperty(property);
        }
                
    }
}