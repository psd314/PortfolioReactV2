var RadTreeView_KeyboardHooked= false; var RadTreeView_Active=null; var RadTreeView_DragActive=null; var RadTreeView_MouseMoveHooked= false; var RadTreeView_MouseUpHooked= false; var RadTreeView_MouseY=0; var RadTreeViewGlobalFirstParam=null; var RadTreeViewGlobalSecondParam=null; var RadTreeViewGlobalThirdParam=null; var contextMenuToBeHidden=null; if (typeof(window.RadControlsNamespace)=="\x75\x6edefine\x64"){window.RadControlsNamespace=new Object(); } ; RadControlsNamespace.AppendStyleSheet= function (O,o,I){if (!I){return; }if (!O){document.write("<"+"\x6c\151\x6e\x6b"+"\x20\x72el=\047\x73ty\x6c\x65she\x65t\047\x20type=\x27\164e\x78t/cs\x73\047\x20href=\x27"+I+"\x27 />"); }else {var U=document.createElement("LIN\x4b"); U.rel="s\x74\x79leshee\x74"; U.type="text/css"; U.href=I; document.getElementById(o+"\x53tyleShee\x74\x48old\x65\x72").appendChild(U); }} ; function RadTreeNode(){ this.Parent=null; this.TreeView=null; this.Nodes=new Array(); this.ID=null; this.ClientID=null; this.SignImage=null; this.SignImageExpanded=null; this.Image=0; this.ImageExpanded=0; this.Action=null; this.Index=0; this.Level=0; this.Text=null; this.Value=null; this.Category=null; this.NodeCss=null; this.NodeCssOver=null; this.NodeCssSelect=null; this.ContextMenuName=null; this.Enabled= true; this.Expanded= false; this.Checked= false; this.Selected= false; this.DragEnabled=1; this.DropEnabled=1; this.EditEnabled=1; this.ExpandOnServer=0; this.IsClientNode=0; this.Attributes=new Array(); this.Z= false; } ; RadTreeNode.prototype.Next= function (){var z=(this.Parent!=null)?this.Parent.Nodes: this.TreeView.Nodes; return (this.Index>=z.length)?null:z[this.Index+1]; } ; RadTreeNode.prototype.Prev= function (){var z=(this.Parent!=null)?this.Parent.Nodes: this.TreeView.Nodes; return (this.Index<=0)?null:z[this.Index-1]; } ; RadTreeNode.prototype.NextVisible= function (){if (this.Expanded)return this.Nodes[0]; if (this.Next()!=null)return this.Next(); var W=this ; while (W.Parent!=null){if (W.Parent.Next()!=null)return W.Parent.Next(); W=W.Parent; }return null; } ; RadTreeNode.prototype.PrevVisible= function (){if (this.Prev()!=null){return this.Prev(); }if (this.Parent!=null){return this.Parent; }return null; } ; RadTreeNode.prototype.Toggle= function (){if (this.Enabled){if (this.TreeView.FireEvent(this.TreeView.BeforeClientToggle,this )== false){return; } (this.Expanded)?this.Collapse(): this.Expand(); this.TreeView.FireEvent(this.TreeView.AfterClientToggle,this ); }} ; RadTreeNode.prototype.CollapseNonParentNodes= function (){for (var i=0; i<this.TreeView.AllNodes.length; i++){if (this.TreeView.AllNodes[i].Expanded && !this.IsParent(this.TreeView.AllNodes[i])){ this.TreeView.AllNodes[i].CollapseNoEffect(); }}} ; RadTreeNode.prototype.V= function (s){try {return encodeURIComponent(s); }catch (e){return escape(s); }} ; RadTreeNode.prototype.v= function (){ throw new Error("\116o R\x61\x64Tre\x65\x56iew \x69nstance\x20has bee\x6e\040\x63rea\x74ed on \x74he ser\x76\145r\x2e\012"+"Mak\x65\x20sure t\x68\141t \x79\157u\x20\150av\x65\040t\x68\145 \x63ontro\x6c\040i\x6estanc\x65\040\x63\162\x65\141t\x65d.\012"+"\x50\154eas\x65\x20revi\x65\x77 t\x68\x69s a\x72\164i\x63\x6ce \x66or ad\x64\x69ti\x6fnal i\x6e\146o\x72matio\x6e."); };RadTreeNode.prototype.T= function (){var url=this.TreeView.LoadOnDemandUrl+"\x26\x72tnClien\x74\x49D="+this.ClientID+"&rtnLeve\x6c\x3d"+this.Level+"&rtnID="+this.ID+"\x26\x72tnPar\x65\x6etPo\x73\x69ti\x6f\x6e="+this.GetParentPositions()+"\x26rtnTex\x74\x3d"+this.V(this.Text)+"\x26\x72tnVal\x75\x65="+this.V(this.Value)+"\x26rtnCategory\x3d"+this.V(this.Category)+"\x26rtnChecked="+this.Checked; var S; if (typeof(XMLHttpRequest)!="\x75ndefi\x6e\x65d"){S=new XMLHttpRequest(); }else {S=new ActiveXObject("Micr\x6f\x73oft.X\x4d\x4cHTT\x50"); }url=url+"&tim\x65\x53tamp="+encodeURIComponent((new Date()).getTime()); S.open("G\x45\x54",url, true); var R=this ; S.onreadystatechange= function (){if (S.readyState!=4)return; var html=S.responseText; var index=html.indexOf("\x2c"); var Q=parseInt(html.substring(0,index)); var P=html.substring(index+1,Q+index+1); var N=html.substring(Q+index+1); R.LoadNodesOnDemand(P,S.status,url); R.ImageOn(); R.SignOn(); R.Expanded= true; R.ExpandOnServer=0; var M=R.TextElement().parentNode; var m=M.parentNode; switch (R.TreeView.LoadingMessagePosition){case 0:case 1:if (M.tagName=="A"){M.firstChild.innerHTML=R.Text; }else {m=R.TextElement().parentNode; if (R.TextElement().innerText){R.TextElement().innerText=R.Text; }else {R.TextElement().innerHTML=R.Text; }}break; case 2:M.removeChild(document.getElementById(R.ClientID+"\x4coadin\x67")); m=R.TextElement().parentNode; break; case 3:m=R.TextElement().parentNode; }if (R.Nodes.length>0){rtvInsertHTML(m,N); var images=m.getElementsByTagName("IMG"); for (var i=0; i<images.length; i++){RadTreeView.L(images[i]); }var l=m.getElementsByTagName("\x49NPUT"); for (var i=0; i<l.length; i++){l[i].style.verticalAlign="\x6diddle"; }}R.Z= false; R.TreeView.FireEvent(R.TreeView.AfterClientToggle,R); } ; S.send(null); } ; RadTreeNode.prototype.Expand= function (){if (this.ExpandOnServer){if (!this.TreeView.FireEvent(this.TreeView.BeforeClientToggle,this )){return; }if (this.ExpandOnServer==1){ this.TreeView.K("\116\x6fdeExpand",this.ClientID); return; }if (this.ExpandOnServer==2){if (!this.Z){ this.Z= true; switch (this.TreeView.LoadingMessagePosition){case 0: this.TextElement().innerHTML="\x3c\163pa\x6e\x20clas\x73\x3d"+this.TreeView.LoadingMessageCssClass+"\x3e"+this.TreeView.LoadingMessage+"\x3c/span> "+this.TextElement().innerHTML; break; case 1: this.TextElement().innerHTML=this.TextElement().innerHTML+"\x20"+"\x3cspan \x63\x6cass="+this.TreeView.LoadingMessageCssClass+"\076"+this.TreeView.LoadingMessage+"</span\x3e\x20"; break; case 2:rtvInsertHTML(this.TextElement().parentNode,"<d\x69\x76 id="+this.ClientID+"Loadi\x6e\x67 "+"\x20class="+this.TreeView.LoadingMessageCssClass+">"+this.TreeView.LoadingMessage+"</div\x3e"); break; }var R=this ; window.setTimeout( function (){R.T();} ,20); return; }}}if (!this.Nodes.length){return; }if (this.TreeView.SingleExpandPath){ this.CollapseNonParentNodes(); }var k=document.getElementById("G"+this.ClientID); if (this.TreeView.ExpandDelay>0){k.style.overflow="\x68idden"; k.style.height="\x31px"; k.style.display="block"; k.firstChild.style.position="\x72\x65lative"; window.setTimeout("rtvNodeE\x78\x70and(\x31\x2c\047"+k.id+"\x27\054"+this.TreeView.ExpandDelay+"\x29;",20); }else {k.style.display="b\x6c\x6fck"; } this.ImageOn(); this.SignOn(); this.Expanded= true; if (!this.IsClientNode){ this.TreeView.UpdateExpandedState(); }} ; RadTreeNode.prototype.GetParentPositions= function (){var parentNode=this ; var J=""; while (parentNode!=null){if (parentNode.Next()!=null){J=J+"\x31"; }else {J=J+"0"; }parentNode=parentNode.Parent; }return J; } ; RadTreeNode.prototype.Collapse= function (){if (this.Nodes.length>0){if (this.TreeView.ExpandDelay>0){var k=document.getElementById("\x47"+this.ClientID); if (k.scrollHeight!="undefined"){k.style.overflow="h\x69\x64den"; k.style.display="block"; k.firstChild.style.position="\x72\x65lative"; window.setTimeout("rt\x76\x4eodeCol\x6capse("+k.scrollHeight+"\x2c\047"+k.id+"\047\x2c"+this.TreeView.ExpandDelay+"\x20);",20); }else { this.CollapseNoEffect(); }}else { this.CollapseNoEffect(); } this.ImageOff(); this.SignOff(); this.Expanded= false; this.TreeView.UpdateExpandedState(); }} ; RadTreeNode.prototype.CollapseNoEffect= function (){if (this.Nodes.length>0){var k=document.getElementById("G"+this.ClientID); k.style.display="none"; this.ImageOff(); this.SignOff(); this.Expanded= false; this.TreeView.UpdateExpandedState(); }} ; RadTreeNode.prototype.Highlight= function (e){if (!this.Enabled){return; }if (e){if (this.TreeView.MultipleSelect && (e.ctrlKey || e.shiftKey)){if (this.Selected){ this.TextElement().className=this.NodeCss; this.Selected= false; if (this.TreeView.SelectedNode==this ){ this.TreeView.SelectedNode=null; } this.TreeView.UpdateSelectedState(); return; }}else { this.TreeView.UnSelectAllNodes(); }} this.TextElement().className=this.NodeCssSelect; this.TreeView.SelectNode(this ); this.TreeView.FireEvent(this.TreeView.AfterClientHighlight,this ); } ; RadTreeNode.prototype.ExecuteAction= function (e){if (this.IsClientNode){return; }if (this.TextElement().tagName=="A"){ this.TextElement().click(); }else if (this.Action){ this.TreeView.K("NodeCl\x69ck",this.ClientID); }if (e){ (document.all)?e.returnValue= false :e.preventDefault(); }} ; RadTreeNode.prototype.Select= function (e){if (this.TreeView.FireEvent(this.TreeView.BeforeClientClick,this,e)== false)return; if (this.Enabled){ this.Highlight(e); this.TreeView.LastHighlighted=this ; this.ExecuteAction(); }else { (document.all)?e.returnValue= false :e.preventDefault(); } this.TreeView.FireEvent(this.TreeView.AfterClientClick,this,e); } ; RadTreeNode.prototype.UnSelect= function (){if (this.TextElement().parentNode && this.TextElement().parentNode.tagName=="A"){ this.TextElement().parentNode.className=this.NodeCss; } this.TextElement().className=this.NodeCss; this.Selected= false; } ; RadTreeNode.prototype.Disable= function (){ this.TextElement().className=this.TreeView.NodeCssDisable; this.Enabled= false; this.Selected= false; if (this.CheckElement()!=null)this.CheckElement().disabled= true; } ; RadTreeNode.prototype.Enable= function (){ this.TextElement().className=this.NodeCss; this.Enabled= true; if (this.CheckElement()!=null){ this.CheckElement().disabled= false; }} ; RadTreeNode.prototype.Hover= function (){if (this.Enabled){if (this.TreeView.FireEvent(this.TreeView.BeforeClientHighlight,this )== false){return; } this.TreeView.LastHighlighted=this ; if (RadTreeView_DragActive!=null && RadTreeView_DragActive.DragClone!=null && (!this.Expanded) && this.ExpandOnServer!=1){var R=this ; window.setTimeout( function (){R.H(); } ,1000); }if (!this.Selected){ this.TextElement().className=this.NodeCssOver; if (this.Image){ this.ImageElement().style.cursor="\x68\x61nd"; }} this.TreeView.FireEvent(this.TreeView.AfterClientHighlight,this ); }} ; RadTreeNode.prototype.H= function (){if (RadTreeView_DragActive!=null && RadTreeView_DragActive.DragClone!=null && (!this.Expanded)){if (RadTreeView_Active.LastHighlighted==this ){ this.Expand(); }}} ; RadTreeNode.prototype.UnHover= function (){if (this.Enabled){ this.TreeView.LastHighlighted=null; if (!this.Selected){ this.TextElement().className=this.NodeCss; if (this.Image){ this.ImageElement().style.cursor="def\x61ult"; }} this.TreeView.FireEvent(this.TreeView.AfterClientMouseOut,this ); }} ; RadTreeNode.prototype.CheckBoxClick= function (e){if (this.Enabled){if (this.TreeView.FireEvent(this.TreeView.BeforeClientCheck,this )== false){ (this.Checked)?this.Check(): this.UnCheck(); return; } (this.Checked)?this.UnCheck(): this.Check(); if (this.TreeView.AutoPostBackOnCheck){ this.TreeView.K("\x4eodeChe\x63\x6b",this.ClientID); this.TreeView.FireEvent(this.TreeView.AfterClientCheck,this ); return; } this.TreeView.FireEvent(this.TreeView.AfterClientCheck,this ); }} ; RadTreeNode.prototype.Check= function (){if (this.CheckElement()!=null){ this.CheckElement().checked= true; this.Checked= true; this.TreeView.UpdateCheckedState(); }} ; RadTreeNode.prototype.UnCheck= function (){if (this.CheckElement()!=null){ this.CheckElement().checked= false; this.Checked= false; this.TreeView.UpdateCheckedState(); }} ; RadTreeNode.prototype.IsSet= function (a){return (a!=null && a!=""); } ; RadTreeNode.prototype.ImageOn= function (){var h=document.getElementById(this.ClientID+"i"); if (this.ImageExpanded!=0){h.src=this.ImageExpanded; }} ; RadTreeNode.prototype.ImageOff= function (){var h=document.getElementById(this.ClientID+"i"); if (this.Image!=0){h.src=this.Image; }} ; RadTreeNode.prototype.SignOn= function (){var g=document.getElementById(this.ClientID+"c"); if (this.IsSet(this.SignImageExpanded)){g.src=this.SignImageExpanded; }} ; RadTreeNode.prototype.SignOff= function (){var g=document.getElementById(this.ClientID+"\x63"); if (this.IsSet(this.SignImage)){g.src=this.SignImage; }} ; RadTreeNode.prototype.TextElement= function (){var F=document.getElementById(this.ClientID); var f=F.getElementsByTagName("span")[0]; if (f==null){f=F.getElementsByTagName("a")[0]; }return f; } ; RadTreeNode.prototype.ImageElement= function (){return document.getElementById(this.ClientID+"\x69"); } ; RadTreeNode.prototype.CheckElement= function (){return document.getElementById(this.ClientID).getElementsByTagName("\x69nput")[0]; } ; RadTreeNode.prototype.IsParent= function (node){var parent=this.Parent; while (parent!=null){if (node==parent)return true; parent=parent.Parent; }return false; } ; RadTreeNode.prototype.StartEdit= function (){if (this.EditEnabled){var D=this.Text; this.TreeView.EditMode= true; var parentElement=this.TextElement().parentNode; this.TreeView.EditTextElement=this.TextElement().cloneNode( true); this.TextElement().parentNode.removeChild(this.TextElement()); var d=this ; var C=document.createElement("\x69nput"); C.setAttribute("\x74\x79pe","text"); C.setAttribute("size",this.Text.length+3); C.setAttribute("value",D); C.className=this.TreeView.NodeCssEdit; var B=this ; C.onblur= function (){B.EndEdit(); } ; C.onchange= function (){B.EndEdit(); } ; C.onkeypress= function (e){B.AnalyzeEditKeypress(e); } ; C.onsubmit= function (){return false; } ; parentElement.appendChild(C); this.TreeView.EditInputElement=C; C.focus(); C.onselectstart= function (e){if (!e)e=window.event; if (e.stopPropagation){e.stopPropagation(); }else {e.cancelBubble= true; }} ; var o0=0; var O0=this.Text.length; if (C.createTextRange){var l0=C.createTextRange(); l0.moveStart("chara\x63ter",o0); l0.moveEnd("charac\x74\x65r",O0); l0.select(); }else {C.setSelectionRange(o0,O0); }}} ; RadTreeNode.prototype.EndEdit= function (){ this.TreeView.EditInputElement.onblur=null; this.TreeView.EditInputElement.onchange=null; var parentElement=this.TreeView.EditInputElement.parentNode; if (this.TreeView.FireEvent(this.TreeView.AfterClientEdit,this,this.Text,this.TreeView.EditInputElement.value)!= false){if (this.Text!=this.TreeView.EditInputElement.value){var i0=this.ClientID+":"+this.TreeView.I0(this.TreeView.EditInputElement.value); this.TreeView.K("\x4eodeEdit",i0); return; } this.TreeView.EditTextElement.innerHTML=this.TreeView.EditInputElement.value; this.Text=this.TreeView.EditInputElement.value; } this.TreeView.EditInputElement.parentNode.removeChild(this.TreeView.EditInputElement); parentElement.appendChild(this.TreeView.EditTextElement); this.TreeView.EditMode= false; this.TreeView.EditInputElement=null; this.TreeView.EditTextElement=null; } ; RadTreeNode.prototype.AnalyzeEditKeypress= function (e){if (document.all)e=event; if (e.keyCode==13){ (document.all)?e.returnValue= false :e.preventDefault(); this.EndEdit(); return false; }if (e.keyCode==27){ this.TreeView.EditInputElement.value=this.TreeView.EditTextElement.innerHTML; this.EndEdit(); }return true; } ; RadTreeNode.prototype.LoadNodesOnDemand= function (s,o1,url){if (o1==404){var O1="CallBack \x55\122\x4c\040\x6e\x6ft\x20\146o\x75\x6ed: \x0a\015\x0a\015"+url+"\012\x0d\x0a\015\x41re you\x20\165s\x69\156g\x20\x55RL\x20\x52ew\x72iter?\x20\120l\x65ase, \x74\162y\x20sett\x69\156g\x20the \x41ja\x78Url \x70rope\x72ty t\x6f ma\x74ch \x74\x68\x65 co\x72rec\x74 UR\x4c yo\x75 n\x65ed"; alert(O1); this.TreeView.FireEvent(this.TreeView.AfterClientCallBackError,this.TreeView); }else {try {eval(s); var l1=eval(this.ClientID+"Cli\x65\x6etData"); for (var i=0; i<l1.length; i++){l1[i][17]=0; this.TreeView.LoadNode(l1[i],null,this ); }}catch (e){ this.TreeView.FireEvent(this.TreeView.AfterClientCallBackError,this.TreeView); }}} ; function RadTreeView(i1){if (window.tlrkTreeViews==null){window.tlrkTreeViews=new Array(); }if (window.tlrkTreeViews[i1]!=null){I1=window.tlrkTreeViews[i1]; I1.Dispose(); }tlrkTreeViews[i1]=this ; this.Nodes=new Array(); this.AllNodes=new Array(); this.ClientID=null; this.SelectedNode=null; this.DragMode= false; this.DragSource=null; this.DragClone=null; this.LastHighlighted=null; this.MouseInside= false; this.HtmlElementID=""; this.EditMode= false; this.EditTextElement=null; this.EditInputElement=null; this.BeforeClientClick=null; this.BeforeClientHighlight=null; this.AfterClientHighlight=null; this.AfterClientMouseOut=null; this.BeforeClientDrop=null; this.AfterClientDrop=null; this.BeforeClientToggle=null; this.AfterClientToggle=null; this.BeforeClientContextClick=null; this.BeforeClientContextMenu=null; this.AfterClientContextClick=null; this.BeforeClientCheck=null; this.AfterClientCheck=null; this.AfterClientMove=null; this.AfterClientFocus=null; this.BeforeClientDrag=null; this.AfterClientEdit=null; this.AfterClientClick=null; this.BeforeClientDoubleClick=null; this.AfterClientCallBackError=null; this.AutoPostBackOnCheck= false; this.CausesValidation= true; this.ContextMenuVisible= false; this.ContextMenuName=null; this.o2=null; this.SingleExpandPath= false; this.ExpandDelay=2; this.TabIndex=0; this.AllowNodeEditing= false; this.LoadOnDemandUrl=null; this.LoadingMessage="\050loading ...\x29"; this.LoadingMessagePosition=0; this.LoadingMessageCssClass="LoadingMess\x61\x67e"; this.O2= false; } ; RadTreeView.L= function (l2){l2.align="absmiddle"; l2.style.display="\151n\x6c\x69ne"; if (!document.all || window.opera){l2.nextSibling.style.verticalAlign="\x6diddle"; }};RadTreeView.prototype.OnInit= function (){var ImageList=new Array(); this.PreloadImages(ImageList); i2=ImageList; var images=document.getElementById(this.Container).getElementsByTagName("\111\x4d\x47"); for (var i=0; i<images.length; i++){var index=images[i].className; if (index!=null && index!=""){images[i].src=ImageList[index].src; RadTreeView.L(images[i]); }} this.LoadTree(ImageList); var l=document.getElementById(this.Container).getElementsByTagName("\x49NPUT"); for (var i=0; i<l.length; i++){l[i].style.verticalAlign="\x6diddl\x65"; }if (document.addEventListener && (!RadTreeView_KeyboardHooked)){RadTreeView_KeyboardHooked= true; document.addEventListener("\x6beydow\x6e",this.KeyDownMozilla, false); }if ((!RadTreeView_MouseMoveHooked) && (this.DragAndDrop)){RadTreeView_MouseMoveHooked= true; if (document.attachEvent){document.attachEvent("\x6fnmousemov\x65",rtvMouseMove); }if (document.addEventListener){document.addEventListener("\x6d\x6fusemov\x65",rtvMouseMove, false); }}if (!RadTreeView_MouseUpHooked){RadTreeView_MouseUpHooked= true; if (document.attachEvent){document.attachEvent("\x6fnmouseup",rtvMouseUp); }if (document.addEventListener){document.addEventListener("mouseup",rtvMouseUp, false); }} this.I2(); this.O2= true; } ; RadTreeView.prototype.I2= function (){var d=this ; var o3=document.getElementById(this.Container); o3.onfocus= function (e){rtvDispatcher(d.ClientID,"\x66ocus",e); } ; o3.onmouseover= function (e){rtvDispatcher(d.ClientID,"mover",e); } ; o3.onmouseout= function (e){rtvDispatcher(d.ClientID,"mout",e); } ; o3.oncontextmenu= function (e){rtvDispatcher(d.ClientID,"cont\x65\x78t",e); } ; o3.onscroll= function (e){rtvDispatcher(d.ClientID,"s\x63\x72oll",e); } ; o3.onclick= function (e){rtvDispatcher(d.ClientID,"\x6d\x63lick",e); } ; o3.ondblclick= function (e){rtvDispatcher(d.ClientID,"\x6d\x64click",e); } ; o3.onkeydown= function (e){rtvDispatcher(d.ClientID,"\x6beydo\x77\x6e",e); } ; o3.onselectstart= function (){return false; } ; o3.ondragstart= function (){return false; } ; if (this.DragAndDrop){o3.onmousedown= function (e){rtvDispatcher(d.ClientID,"\x6ddown",e); } ; }if (window.attachEvent){window.attachEvent("onun\x6c\x6fad", function (){d.Dispose(); } ); } this.O3=o3; } ; RadTreeView.prototype.Dispose= function (){if (this.l3)return; this.l3= true; try {var o3=this.O3; if (o3!=null){for (var i3 in o3){if (typeof(o3[i3])=="fu\x6ection"){o3[i3]=null; }}for (var i3 in this ){if (i3!="Dispose"){ this[i3]=null; }}} this.O3=null; }catch (I3){}};RadTreeView.prototype.PreloadImages= function (images){var imageData=eval(this.ClientID+"\x49\x6dageDat\x61"); for (var i=0; i<imageData.length; i++){var o4=new Image(); o4.src=imageData[i]; images[i]=o4; }} ; RadTreeView.prototype.FindNode= function (node){for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].ClientID==node){return this.AllNodes[i]; }}return null; } ; RadTreeView.prototype.FindNodeByText= function (text){for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Text==text){return this.AllNodes[i]; }}return null; } ; RadTreeView.prototype.FindNodeByValue= function (value){for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Value==value){return this.AllNodes[i]; }}return null; } ; RadTreeView.prototype.LoadTree= function (O4){var l4=eval(this.ClientID+"\x43\x6c\x69entD\x61\164\x61"); for (var i=0; i<l4.length; i++){ this.LoadNode(l4[i],O4); }} ; RadTreeView.prototype.LoadNode= function (l4,O4,parentNode){var i4=new RadTreeNode(); i4.ClientID=l4[0]; i4.TreeView=this ; var I4=l4[17]; if (I4>0){i4.Parent=this.AllNodes[I4-1]; }if (parentNode!=null){i4.Parent=parentNode; }i4.NodeCss=this.NodeCss; i4.NodeCssOver=this.NodeCssOver; i4.NodeCssSelect=this.NodeCssSelect; i4.Text=l4[1]; i4.Value=l4[2]; i4.Category=l4[3]; if (O4!=null){i4.SignImage=O4[l4[4]].src; i4.SignImageExpanded=O4[l4[5]].src; }else {i4.SignImage=i2[l4[4]].src; i4.SignImageExpanded=i2[l4[5]].src; }if (l4[6]>0){i4.Image=O4[l4[6]].src; }if (l4[7]>0){i4.ImageExpanded=O4[l4[7]].src; }i4.Selected=l4[8]; if (i4.Selected){ this.SelectedNode=i4; }i4.Checked=l4[9]; i4.Enabled=l4[10]; i4.Expanded=l4[11]; i4.Action=l4[12]; if (this.IsSet(l4[13]))i4.NodeCss=l4[13]; if (this.IsSet(l4[14]))i4.ContextMenuName=l4[14]; this.AllNodes[this.AllNodes.length]=i4; if (i4.Parent!=null){i4.Parent.Nodes[i4.Parent.Nodes.length]=i4; }else { this.Nodes[this.Nodes.length]=i4; }i4.Index=l4[16]; i4.DragEnabled=l4[18]; i4.DropEnabled=l4[19]; i4.ExpandOnServer=l4[20]; if (this.IsSet(l4[21]))i4.NodeCssOver=l4[21]; if (this.IsSet(l4[22]))i4.NodeCssSelect=l4[22]; i4.Level=l4[23]; i4.ID=l4[24]; i4.IsClientNode=l4[25]; i4.EditEnabled=l4[26]; i4.Attributes=l4[27]; } ; RadTreeView.prototype.Toggle= function (node){ this.FindNode(node).Toggle(); } ; RadTreeView.prototype.Select= function (node,e){ this.FindNode(node).Select(e); } ; RadTreeView.prototype.Hover= function (node){var node=this.FindNode(node); if (node)node.Hover(); } ; RadTreeView.prototype.UnHover= function (node){var node=this.FindNode(node); if (node)node.UnHover(); } ; RadTreeView.prototype.CheckBoxClick= function (node,e){ this.FindNode(node).CheckBoxClick(e); } ; RadTreeView.prototype.Highlight= function (node,e){ this.FindNode(node).Highlight(e); } ; RadTreeView.prototype.SelectNode= function (node){ this.SelectedNode=node; node.Selected= true; this.UpdateSelectedState(); } ; RadTreeView.prototype.GetSelectedNodes= function (){var o5=new Array(); for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Selected)o5[o5.length]=this.AllNodes[i]; }return o5; } ; RadTreeView.prototype.UnSelectAllNodes= function (node){for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Selected && this.AllNodes[i].Enabled){ this.AllNodes[i].UnSelect(); }}} ; RadTreeView.prototype.KeyDownMozilla= function (e){var LastActiveRadTreeView=RadTreeView_Active; if (LastActiveRadTreeView){if (!LastActiveRadTreeView.O2)return; if (LastActiveRadTreeView!=null && LastActiveRadTreeView.SelectedNode!=null){if (LastActiveRadTreeView.EditMode)return; if (e.keyCode==107 || e.keyCode==109 || e.keyCode==37 || e.keyCode==39)LastActiveRadTreeView.SelectedNode.Toggle(); if (e.keyCode==40 && LastActiveRadTreeView.SelectedNode.NextVisible()!=null)LastActiveRadTreeView.SelectedNode.NextVisible().Highlight(e); if (e.keyCode==38 && LastActiveRadTreeView.SelectedNode.PrevVisible()!=null)LastActiveRadTreeView.SelectedNode.PrevVisible().Highlight(e); if (e.keyCode==13){if (LastActiveRadTreeView.FireEvent(LastActiveRadTreeView.BeforeClientClick,LastActiveRadTreeView.SelectedNode,e)== false){return; }LastActiveRadTreeView.SelectedNode.ExecuteAction(); LastActiveRadTreeView.FireEvent(LastActiveRadTreeView.AfterClientClick,LastActiveRadTreeView.SelectedNode,e); }if (e.keyCode==32)LastActiveRadTreeView.SelectedNode.CheckBoxClick(); if (e.keyCode==113 && LastActiveRadTreeView.AllowNodeEditing)LastActiveRadTreeView.SelectedNode.StartEdit(); }}} ; RadTreeView.prototype.KeyDown= function (e){if (this.EditMode)return; var node=this.SelectedNode; if (node!=null){if (e.keyCode==107 || e.keyCode==109 || e.keyCode==37 || e.keyCode==39)node.Toggle(); if (e.keyCode==40 && node.NextVisible()!=null)node.NextVisible().Highlight(e); if (e.keyCode==38 && node.PrevVisible()!=null)node.PrevVisible().Highlight(e); if (e.keyCode==13){if (this.FireEvent(this.BeforeClientClick,this.SelectedNode,e)== false){return; }node.ExecuteAction(e); this.FireEvent(this.AfterClientClick,this.SelectedNode,e); }if (e.keyCode==32){node.CheckBoxClick(); (document.all)?e.returnValue= false :e.preventDefault(); }if (e.keyCode==113 && this.AllowNodeEditing){node.StartEdit(); }}else {if (e.keyCode==38 || e.keyCode==40 || e.keyCode==13 || e.keyCode==32){ this.Nodes[0].Highlight(); }}} ; RadTreeView.prototype.UpdateState= function (){ this.UpdateExpandedState(); this.UpdateCheckedState(); this.UpdateSelectedState(); } ; RadTreeView.prototype.UpdateExpandedState= function (){var O5=""; for (var i=0; i<this.AllNodes.length; i++){var l5=(this.AllNodes[i].Expanded)?"\x31": "0"; O5+=l5; }document.getElementById(this.ClientID+"\x5fexpanded").value=O5; } ; RadTreeView.prototype.UpdateCheckedState= function (){var i5=""; for (var i=0; i<this.AllNodes.length; i++){var I5=(this.AllNodes[i].Checked)?"\x31": "0"; i5+=I5; }document.getElementById(this.ClientID+"\x5fchecke\x64").value=i5; } ; RadTreeView.prototype.UpdateSelectedState= function (){var o6=""; for (var i=0; i<this.AllNodes.length; i++){var O6=(this.AllNodes[i].Selected)?"1": "0"; o6+=O6; }document.getElementById(this.ClientID+"\x5fselect\x65\x64").value=o6; } ; RadTreeView.prototype.Scroll= function (e){document.getElementById(this.ClientID+"\x5fscroll").value=document.getElementById(this.Container).scrollTop; } ; RadTreeView.prototype.ContextMenuClick= function (e,l6,i6,I6){d=this ; window.setTimeout( function (){d.HideContextMenu();} ,10); if (this.FireEvent(this.BeforeClientContextClick,this.o2,l6,I6)== false){return; }if (i6){var o7=this.o2.ClientID+":"+this.I0(l6)+":"+this.I0(I6); this.K("\x43on\x74\x65xtMen\x75\x43lic\x6b",o7); }} ; RadTreeView.prototype.ContextMenu= function (e,O7){var src=(e.srcElement)?e.srcElement:e.target; var node=this.FindNode(O7); if (node!=null && this.BeforeClientContextMenu!=null){var l7=this.SelectedNode; if (this.FireEvent(this.BeforeClientContextMenu,node,e,l7)== false){return; } this.Highlight(O7,e,l7); }if (node!=null && node.ContextMenuName!=null && node.Enabled){if (!this.ContextMenuVisible){ this.o2=node; if (!node.Selected){ this.Highlight(O7,e); } this.ShowContextMenu(node.ContextMenuName,e); document.all?e.returnValue= false :e.preventDefault(); }}} ; RadTreeView.prototype.ShowContextMenu= function (name,e){if (!document.readyState || document.readyState=="\x63omp\x6c\x65te"){var i7="r\x74\x76cm"+this.ClientID+name; var menu=document.getElementById(i7); if (menu){var I7=menu.cloneNode( true); I7.id=i7+"_clone"; document.body.appendChild(I7); I7=document.getElementById(i7+"_clone"); I7.style.left=this.o8(e)+"px"; I7.style.top=this.O8(e)+"\x70x"; I7.style.position="\x61\x62solute"; I7.style.display="\x62\x6cock"; this.ContextMenuVisible= true; this.ContextMenuName=name; document.all?e.returnValue= false :e.preventDefault(); }}} ; RadTreeView.prototype.O8= function (e){if (document.compatMode && document.compatMode=="C\x53\x531Comp\x61\x74"){return (e.clientY+document.documentElement.scrollTop); }return (e.clientY+document.body.scrollTop); } ; RadTreeView.prototype.o8= function (e){if (document.compatMode && document.compatMode=="\x43SS1Com\x70\x61t"){return (e.clientX+document.documentElement.scrollLeft); }return (e.clientX+document.body.scrollLeft); } ; RadTreeView.prototype.HideContextMenu= function (){if (!document.readyState || document.readyState=="\x63omplete"){var l8=document.getElementById("\x72tvcm"+this.ClientID+this.ContextMenuName+"\x5fclone"); if (l8){document.body.removeChild(l8); } this.ContextMenuVisible= false; }} ; RadTreeView.prototype.MouseClickDispatcher= function (e){var src=(e.srcElement)?e.srcElement:e.target; var O7=rtvGetNodeID(e); if (O7!=null){var i8=this.FindNode(O7); if (i8.Selected){if (this.AllowNodeEditing){i8.StartEdit(); return; }else { this.Select(O7,e); }}else { this.Select(O7,e); }}if (src.tagName=="IMG"){var I8=src.className; if (this.IsSet(I8) && this.o9(I8)){ this.Toggle(src.parentNode.id); }}if (src.tagName=="\x49\x4e\x50UT" && rtvInsideNode(src)){ this.CheckBoxClick(src.parentNode.id,e); }} ; RadTreeView.prototype.o9= function (O9){return (O9==1 || O9==2 || O9==5 || O9==6 || O9==7 || O9==8 || O9==10 || O9==11); } ; RadTreeView.prototype.DoubleClickDispatcher= function (e,O7){var node=this.FindNode(O7); if (this.FireEvent(this.BeforeClientDoubleClick,node)== false){return; } this.Toggle(O7); } ; RadTreeView.prototype.MouseOverDispatcher= function (e,O7){ this.Hover(O7); } ; RadTreeView.prototype.MouseOutDispatcher= function (e,O7){ this.UnHover(O7); } ; RadTreeView.prototype.MouseDown= function (e){if (this.LastHighlighted!=null && this.DragAndDrop){if (this.FireEvent(this.BeforeClientDrag,this.LastHighlighted)== false)return; if (!this.LastHighlighted.DragEnabled)return; if (e.button==2)return; this.DragSource=this.LastHighlighted; this.DragClone=document.createElement("div"); document.body.appendChild(this.DragClone); RadTreeView_DragActive=this ; var l9=""; if (this.MultipleSelect && (this.SelectedNodesCount()>1)){for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Selected){if (this.AllNodes[i].Image){var img=this.AllNodes[i].ImageElement(); var i9=img.cloneNode( true); this.DragClone.appendChild(i9); }var I9=this.AllNodes[i].TextElement().cloneNode( true); I9.className=this.AllNodes[i].NodeCss; I9.style.color="gray"; this.DragClone.appendChild(I9); this.DragClone.appendChild(document.createElement("BR")); }l9=l9+"te\x78t"; }}if (l9==""){if (this.LastHighlighted.Image){var img=this.LastHighlighted.ImageElement(); var i9=img.cloneNode( true); this.DragClone.appendChild(i9); }var I9=this.LastHighlighted.TextElement().cloneNode( true); I9.className=this.LastHighlighted.NodeCss; I9.style.color="gray"; this.DragClone.appendChild(I9); } this.DragClone.style.position="abso\x6c\x75te"; this.DragClone.style.display="\156\x6f\x6ee"; if (e.preventDefault){e.preventDefault(); }}} ; RadTreeView.prototype.SelectedNodesCount= function (){var count=0; for (var i=0; i<this.AllNodes.length; i++){if (this.AllNodes[i].Selected)count++; }return count; } ; RadTreeView.prototype.FireEvent= function (oa,a,b,Oa){if (!oa){return true; }RadTreeViewGlobalFirstParam=a; RadTreeViewGlobalSecondParam=b; RadTreeViewGlobalThirdParam=Oa; var s=oa+"(RadTreeVi\x65\x77Glo\x62\x61lFi\x72stPa\x72\x61m, \x52\141\x64TreeV\x69ewGlo\x62\141l\x53\145c\x6fndPar\x61m, Ra\x64TreeV\x69ewG\x6coba\x6cThir\x64Para\x6d);"; return eval(s); } ; RadTreeView.prototype.Focus= function (e){ this.FireEvent(this.AfterClientFocus,this ); } ; RadTreeView.prototype.IsSet= function (a){return (a!=null && a!=""); } ; RadTreeView.prototype.la= function (ia){var Ia=0; if (ia.offsetParent){while (ia.offsetParent){Ia+=ia.offsetLeft; ia=ia.offsetParent; }}else if (ia.x)Ia+=ia.x; return Ia; } ; RadTreeView.prototype.ob= function (ia){var Ob=0; if (ia.offsetParent){while (ia.offsetParent){Ob+=ia.offsetTop; ia=ia.offsetParent; }}else if (ia.y)Ob+=ia.y; return Ob; } ; RadTreeView.prototype.K= function (lb,i0){var ib=lb+"#"+i0; if (this.PostBackOptionsClientString){var Ib=this.PostBackOptionsClientString.replace(/\x40\x40\x61\x72\x67\x75\x6d\x65\x6e\x74\x73\x40\x40/g,ib); if (typeof(WebForm_PostBackOptions)!="\x75ndef\x69\x6eed" || Ib.indexOf("\137\x64\x6fPostB\x61\x63k")>-1 || Ib.indexOf("AsyncReque\x73\x74")>-1){eval(Ib); }}else {if (this.CausesValidation){if (!(typeof(Page_ClientValidate)!="function" || Page_ClientValidate())){return; }}var oc=this.PostBackFunction.replace(/\x40\x40\x61\x72\x67\x75\x6d\x65\x6e\x74\x73\x40\x40/g,ib); eval(oc); }} ; RadTreeView.prototype.I0= function (param){var Oc=param.replace(/\x27/g,"&squote"); Oc=Oc.replace(/\x23/g,"\x26ssharp"); Oc=Oc.replace(/\x3a/g,"\x26scolon"); Oc=Oc.replace(/\x5c/g,"\134\x5c"); return Oc; } ; function rtvIsAnyContextMenuVisible(){for (var key in tlrkTreeViews)if ((typeof(tlrkTreeViews[key])!="funct\x69\157n") && tlrkTreeViews[key].ContextMenuVisible)return true; return false; } ; function rtvAdjustScroll(){if (RadTreeView_DragActive==null || RadTreeView_DragActive.DragClone==null){return; }var lc=RadTreeView_Active; var ic=document.getElementById(RadTreeView_Active.Container); var Ic,od; Ic=lc.ob(ic); od=Ic+ic.offsetHeight; if ((RadTreeView_MouseY-Ic)<50 && ic.scrollTop>0){ic.scrollTop=ic.scrollTop-10; lc.Scroll(); RadTreeView_ScrollTimeout=window.setTimeout( function (){rtvAdjustScroll(); } ,100); }else if ((od-RadTreeView_MouseY)<50 && ic.scrollTop<(ic.scrollHeight-ic.offsetHeight+16)){ic.scrollTop=ic.scrollTop+10; lc.Scroll(); RadTreeView_ScrollTimeout=window.setTimeout( function (){rtvAdjustScroll(); } ,100); }} ; function rtvMouseUp(e){if (RadTreeView_Active==null)return; if (e && !e.ctrlKey){for (var key in tlrkTreeViews){if ((typeof(tlrkTreeViews[key])!="\x66\x75nction") && tlrkTreeViews[key].ContextMenuVisible){contextMenuToBeHidden=tlrkTreeViews[key]; window.setTimeout( function (){if (contextMenuToBeHidden){contextMenuToBeHidden.HideContextMenu(); }} ,10); return; }}}if (RadTreeView_DragActive==null || RadTreeView_DragActive.DragClone==null){return; } (document.all)?e.returnValue= false :e.preventDefault(); var Od=RadTreeView_DragActive.DragSource; var ld=RadTreeView_Active.LastHighlighted; var oe=RadTreeView_Active; document.body.removeChild(RadTreeView_DragActive.DragClone); RadTreeView_DragActive.DragClone=null; if (ld!=null && ld.DropEnabled== false)return; if (Od==ld)return; if (RadTreeView_DragActive.FireEvent(RadTreeView_DragActive.BeforeClientDrop,Od,ld,e)== false)return; if (Od.IsClientNode || ((ld!=null) && ld.IsClientNode))return; var Oe=RadTreeView_DragActive.ClientID+"#"+Od.ClientID+"#"; var le=""; if (ld==null){le="null"+"\x23"+RadTreeView_DragActive.HtmlElementID; }else {le=oe.ClientID+"\x23"+ld.ClientID; }if (ld==null && RadTreeView_DragActive.HtmlElementID==""){return; }RadTreeView_DragActive.K("NodeDrop",Oe+le); RadTreeView_DragActive.FireEvent(RadTreeView_DragActive.AfterClientDrop,Od,ld,e); RadTreeView_DragActive=null; } ; function rtvMouseMove(e){if (rtvIsAnyContextMenuVisible()){return; }if (RadTreeView_DragActive!=null && RadTreeView_DragActive.DragClone!=null){var ie,Ie; ie=RadTreeView_DragActive.o8(e)+8; Ie=RadTreeView_DragActive.O8(e)+4; RadTreeView_MouseY=Ie; rtvAdjustScroll(); RadTreeView_DragActive.DragClone.style.zIndex=999; RadTreeView_DragActive.DragClone.style.top=Ie+"\x70x"; RadTreeView_DragActive.DragClone.style.left=ie+"px"; RadTreeView_DragActive.DragClone.style.display="bloc\x6b"; RadTreeView_DragActive.FireEvent(RadTreeView_DragActive.AfterClientMove,e); (document.all)?e.returnValue= false :e.preventDefault(); }} ; function rtvNodeExpand(a,id,of){var Of=document.getElementById(id); var If=Of.scrollHeight; var og=(If-a)/of; var height=a+og; if (height>If-1){Of.style.height=""; Of.firstChild.style.position=""; }else {Of.style.height=height+"\x70x"; window.setTimeout("\x72\x74vNodeE\x78\x70and("+height+","+"\x27"+id+"\047,"+of+");",5); }} ; function rtvNodeCollapse(a,id,of){var Of=document.getElementById(id); var If=Of.scrollHeight; var og=(If-Math.abs(If-a))/of; var height=a-og; if (height<=3){Of.style.height=""; Of.style.display="\x6e\x6f\x6ee"; Of.firstChild.style.position=""; }else {Of.style.height=height+"px"; window.setTimeout("\x72tvNode\x43\x6flla\x70\x73e("+height+","+"\x27"+id+"\047\x2c"+of+"\x20);",5); }} ; function rtvGetNodeID(e){if (RadTreeView_Active==null)return; var target=(e.srcElement)?e.srcElement:e.target; if (target.tagName=="\x49MG" && target.nextSibling){var index=target.className; if (index){index=parseInt(index); if (index>12){target=target.nextSibling; }}}while (target!=null){if ((target.tagName=="SPAN" || target.tagName=="\101") && rtvInsideNode(target)){return target.parentNode.id; }target=target.parentNode; }return null; } ; function rtvInsideNode(Og){if (Og.parentNode && Og.parentNode.tagName=="\x44IV" && Og.parentNode.id.indexOf(RadTreeView_Active.ID)>-1){return Og.parentNode.id; }} ; function rtvDispatcher(t,w,e,l6,i6,I6){if (!e){e=window.event; }if (tlrkTreeViews){var O7=rtvGetNodeID(e); var lg=tlrkTreeViews[t]; if (!lg.O2)return; if (rtvIsAnyContextMenuVisible() && w!="\x6d\x63lick" && w!="cclick")return; if (lg.EditMode)return; RadTreeView_Active=lg; switch (w){case "move\x72":if (O7!=null)lg.MouseOverDispatcher(e,O7); break; case "\x6dout":if (O7!=null)lg.MouseOutDispatcher(e,O7); break; case "\155\x63\x6cick":lg.MouseClickDispatcher(e); break; case "mdcli\x63\x6b":if (O7!=null)lg.DoubleClickDispatcher(e,O7); break; case "\155do\x77\x6e":lg.MouseDown(e); break; case "mup":lg.ig(e); break; case "\x63ontext":if (O7!=null){lg.ContextMenu(e,O7); return false; }break; case "\x63click":lg.ContextMenuClick(e,l6,i6,I6); break; case "scroll":lg.Scroll(e); break; case "\x66ocus":lg.Focus(e); case "\x6beydown":lg.KeyDown(e); }}} ; function rtvAppendStyleSheet(o,I){var Ig=(navigator.appName=="\115\x69crosoft \x49\x6eter\x6e\x65t \x45xplorer") && ((navigator.userAgent.toLowerCase().indexOf("\x6dac")!=-1) || (navigator.appVersion.toLowerCase().indexOf("\155a\x63")!=-1)); var oh=(navigator.userAgent.toLowerCase().indexOf("\x73afari")!=-1); if (Ig || oh){document.write("\x3c"+"l\x69\x6ek"+"\x20rel=\047\x73tyl\x65\x73hee\x74\047 \x74\171p\x65\x3d\047\x74ex\x74/css\047\x20hr\x65f=\047"+I+"\047>"); }else {var U=document.createElement("LINK"); U.rel="\163\x74\x79leshee\x74"; U.type="text\x2f\x63ss"; U.href=I; document.getElementById(o+"StyleSheetHo\x6c\144er").appendChild(U); }} ; function rtvInsertHTML(Oh,html){if (Oh.tagName=="\x41"){Oh=Oh.parentNode; }if (document.all){Oh.insertAdjacentHTML("b\x65\x66oreEnd",html); }else {var r=Oh.ownerDocument.createRange(); r.setStartBefore(Oh); var lh=r.createContextualFragment(html); Oh.appendChild(lh); }} ;