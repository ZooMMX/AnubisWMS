<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.inventory.util.RequestUtil"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.inventory.model.PageView"%>
<%@page import="java.util.List"%>
<%@page import="com.inventory.model.BaseVO"%>
<%@page import="com.inventory.model.PageIndex"%>
<%@page import="com.inventory.model.Family"%>

<%
String context = request.getContextPath();
 
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Inventory</title>
<link rel="stylesheet" rev="stylesheet" href="<%=context %>/css/style.css"
	type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
 function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "id"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "id"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}
</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
</head>

 
<%
 
PageView pageView = (PageView)request.getAttribute("Families");
 
%>

<body class="ContentBody">
	<form action="<%=context %>/updateFamilyDo.do" method="post"  name="fom"
		id="fom" target="mainFrame">
		<div class="MainDiv">
			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">
				<tr>
					<th class="tablestyle_title">Family List</th>
				</tr>
				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">


							<TR>
								<TD width="100%">
									 <form name="fom" id="fom" method="post" action="">
<table width="99%" border="0" cellpadding="0" cellspacing="0">
 
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
       
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

          	 
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                   
                  <tr>
<!--                    <td width="18%" align="center" bgcolor="#EEEEEE"> <a href="#" class="right-font08" onclick="selectAll();">Select All</a>&nbsp;&nbsp;&nbsp;<a href="#" class="right-font08" onclick="unselectAll();">UnSelect All</a></span></td>-->
                    <td width="15%" height="20" align="center" bgcolor="#EEEEEE">Name</td>
                    <td width="15%" align="center" bgcolor="#EEEEEE">Description</td>
                   <td width="15%" align="center" bgcolor="#EEEEEE">Operations</td>
                  </tr>
                  
                  <%
                   List<BaseVO> bvs = pageView.getRecords();
                   if(bvs!=null&&bvs.size()>0) { 
                   		 
                  		for(BaseVO bv : bvs) {
                  		
                  			Family p = (Family)bv;
                  %>
                  <tr align="center">
<!--                    <td bgcolor="#FFFFFF"><input type="checkbox" name="id"/></td>-->
                    <td height="20" bgcolor="#FFFFFF"><%=p.getName() %></td>
                    <td bgcolor="#FFFFFF"><%=p.getDesc() %></td>
                     <td bgcolor="#FFFFFF"><a href="updateFamily.do?id=<%=p.getId() %>">Update</a> <a href="deleteFamily.do?ids=<%=p.getId() %>">Delete</a></td>
                  </tr>
                  
                  <%
                  	}
                  }
                  %>
                   
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="99%">
                
                
                
                <% 
                	PageIndex pageIndex = pageView.getPageindex();
                	for(long i = pageIndex.getStartindex();i<=pageIndex.getEndindex();i++){
                %>
                
                	<a href="familyList.do?currentPage=<%=i %>" class="right-font08"><%=i %></a>
                <% 
                	}
                %>
                 Total: <span class="right-text09"> <span class="right-text09"><%=pageView.getTotalrecord() %></span>  Records |<%=pageView.getTotalpage() %></span> |    <span class="right-text09">Current:<%=pageView.getCurrentpage() %></span>  
            
                
                 
                </td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"> </td>
                      <td width="87%"> 
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</div>
</form>
								</TD>
							</TR>

						</TABLE>


					</td>
				</tr>




				 
			</TABLE>


			</td>
			</tr>

	</table>

		</div>
	</form>
</body>
</html>
