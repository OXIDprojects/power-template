var isIE = (window.ActiveXObject)  ? true : false;

var replace_items=false;

function replaceItems(xmlObj) 
{
  var items = xmlObj.getElementsByTagName("item"),item,i,id,old_html,new_html,is_main,target_element;
	// replace the DOM elements
	for (i = 0; i < items.length; i++) 
  {
    item=items[i];
		id = getElementTextNS("", "id", item, 0);
    target_element=document.getElementById(id);
    if (target_element)
    {
      new_html=getElementTextNS("", "html", item, 0);
      is_main=id=='main_content';
      if (is_main)
      {
        old_html=id.innerHTML;
      }
      else
      {
        old_html=id.outerHTML;
      }
      if (old_html != new_html)
      {
        if (is_main)
        {
          target_element.innerHTML = new_html;
        }
        else
        {
          target_element.outerHTML = new_html;
        }
        attach_events(target_element);
      }
    }
	}
}

function getElementTextNS(prefix, local, parentElem, index) {
    var result = "";
    if (prefix && isIE) {
        result = parentElem.getElementsByTagName(prefix + ":" + local)[index];
    } else {
        result = parentElem.getElementsByTagName(local)[index];
    }
    if (result) {
        if (result.childNodes.length > 1) {
            return result.childNodes[1].nodeValue;
        } else {
            return result.firstChild.nodeValue;    		
        }
    } else {
        return "n/a";
    }
}

function addLoadEvent(func)
{
  if (typeof window.onload != "function")
  {
    window.onload = func;
  }
  else
  {
    var oldonload = window.onload;
    window.onload = function()
    {
      oldonload();
      func();
    }
  }
}

function addEvent(obj, evType, fn, useCapture){
  if (obj.addEventListener){
    obj.addEventListener(evType, fn, useCapture);
    return true;
  } else if (obj.attachEvent){
    var r = obj.attachEvent("on"+evType, fn);
    return r;
  } else {
    alert("Handler could not be attached");
  }
} 

function attach_events(area)
{
  if (!area)
  {
    area=document;
  }
  var elements=area.getElementsByTagName('a'),element,i;
  if (elements)
  {
    for (i=0;i<elements.length;i++)
    {
      element=elements[i];
      addEvent(element, 'click', ajax_request, false)
      
    } 
  }
  elements=area.getElementsByTagName('form');
  if (elements)
  {
    for (i=0;i<elements.length;i++)
    {
      element=elements[i];
      addEvent(element, 'submit', ajax_submit, false)
    } 
  }
}

function ajax_init()
{
  attach_events();
  history_start_page=location.href;   //Coomunicate the start-page to the history system
  http('get',history_start_page,ajax_receiver,''); //call out to the server!!!!
}

function get_event_obj(e,is_link)
{
  if (!e) 
  {
    var e = window.event;
  }
  if (e.target) 
  {
    event_obj = e.target;  
  }
  else if (e.srcElement) 
  {
    event_obj = e.srcElement;  
  }
  if (event_obj.nodeType == 3)
  {
    event_obj = event_obj.parentNode;
  }
  var is_valid_event=false;
  if (is_link && event_obj)
  {
    var target=event_obj.target;
    is_valid_event=target.indexOf('_blank')==-1 && target.indexOf('_top')==-1;
  }
  else if (event_obj)
  {
    is_valid_event=true;
  }  
  if (is_valid_event)
  {
    //Stop event bubbling and stop events' default action
    if (e.cancelBubble) 
    {
      e.cancelBubble=true;
      e.returnValue = false;
    }
    else
    {
      e.stopPropagation();
      e.preventDefault();
    }
    //"_popWait" is located im module "engine.js" 
    var id='JSMX_loading';
    
    _popWait(id);
    var wait_indicator=document.getElementById(id);
    if (wait_indicator)
    {
      var px='px';
      wait_indicator=wait_indicator.style;
      wait_indicator.left=mouseX(e)+10+px;
      wait_indicator.top=mouseY(e)-9+px;
      wait_indicator.display='block';
    }
  }
  else
  {
    event_obj = null;
  }
  return event_obj;
}
//Init AJAX-mode on start
addLoadEvent(ajax_init);

//"http" is located im module "engine.js" 
function ajax_request(e)
{
  var event_obj,params;

  event_obj=get_event_obj(e,true);
  if (event_obj)
  {
    params = '';
    http('get',event_obj.href,ajax_receiver,params); //call the server!!!!
    return false;
  }
}

function ajax_submit(e)
{
  var event_obj,params;
  
  event_obj=get_event_obj(e,false);
  if (event_obj)
  {
debugger;  
    params=collect_form_data(event_obj);
    http('post',event_obj.action,ajax_receiver,params); //call the server!!!!
    return false;
  }
}

//Process AJAX-response from the server
function ajax_receiver(xmlObj)
{
  //Add XML-stream to AJAX Browser history  
  history_data[history_pages]=xmlObj;
  dsHistory.addFunction(showContent, window, {
    history_page: history_pages
  });
  history_pages++;
  //Add XML-stream to AJAX Browser history  
  if (replace_items)
  {
    replaceItems(xmlObj); //replace sent items in DOM
  }
  else
  {
    attach_events();
    replace_items=true;    
  }
}

//AJAX Browser history
var history_data=new Array;
var history_pages=0;
var history_start_page=null;

function set_ds_history_start()
{
  addKeyEvent();                                        //Forbid some keys which might disturb AJAX history processing
  document.oncontextmenu=new Function("return false");  //And disable the right mouse button for the same reason.....
  dsHistory.addFunction(function() 
  {
    location.href=history_start_page;
  })
}

//Init AJAX history
addLoadEvent(set_ds_history_start);

//Recreate page from history
function showContent(contentObject, historyObject) 
{
  if (!historyObject || !historyObject.calledFromHistory) 
  {
    dsHistory.addFunction(showContent, window, contentObject);
  }
  replaceItems(history_data[contentObject.history_page]);
}
//AJAX Browser history  

//Collect all data in a form to build ist as a parameter string for AJAX.
function collect_form_data(docForm)
{
  //Scan FORM and gather post-data for AJAX on submit
  with (docForm)
  {
    is_file_upload=false;
    submitContent="";
    current_elements=elements.length;
    for (i=0;i<current_elements;i++)
    {
      formElem=elements[i];
      addvalue=false;
      with (formElem)
      {
        formElem_value=escape(value);
        switch (type)
        {
          // Radio buttons
          // Checkboxes
          case "radio":
          case "checkbox":
            addvalue=checked;
            break;
          // "File" field
          case "file":
            is_file_upload=true;
            break;
          // Text fields, hidden form elements
          /*
          case "text":
          case "hidden":
          case "password":
          case "textarea":
          case "select":
          */
          default:
            addvalue=true;
            break;
        }
        if (addvalue)
        {
          if (formElem_value)
          {
            if (submitContent.length>0)
            {
              submitContent+="&";
            }
            submitContent+=name+"="+formElem_value;
          }
        }
      }
    }
  }
  return submitContent;
}

//Determine the mouses' real(!) event-X-coordinate on the screen
function mouseX(evt) 
{
  if (evt.pageX) 
  {
    return evt.pageX;  
  }
  else if (evt.clientX)
  {
     return evt.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
  }
  else 
  {
    return null;  
  }
}

//Determine the mouses' real(!) event-Y-coordinate on the screen
function mouseY(evt) 
{
  if (evt.pageY) 
  {
    return evt.pageY;  
  }
  else if (evt.clientY)
  {
    return evt.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
  }
  else 
  {
    return null;  
  }
}

//Implement outerHTML for FireFox
if (window.navigator.userAgent.indexOf('Gecko')>1)
{
  HTMLElement.prototype.__defineGetter__("outerHTML", function() {
      var div = document.createElement("div"); 
      div.appendChild(this.cloneNode(true));
      return div.innerHTML;
  });

  HTMLElement.prototype.__defineSetter__("outerHTML", function(new_html) {
      var range = document.createRange();
      this.innerHTML = new_html;
      range.selectNodeContents(this);
      var frag = range.extractContents();
      this.parentNode.insertBefore(frag, this);
      this.parentNode.removeChild(this);
  });
}  