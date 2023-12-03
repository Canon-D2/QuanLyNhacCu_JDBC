<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="http://ttcntt.sgu.edu.vn/wp-content/uploads/2018/11/SGU-LOGO.png">    
<title>Quản lý sản phẩm</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/> 
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">     
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/> 
<link href="css/manager.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/QuanLySanPham.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
<link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
</head>
<body>
<header>
 <jsp:include page="LeftAdmin.jsp"></jsp:include>
</header>
<main>
  <div class="container pt-4">
    <section class="mb-4">
      <div class="card">
        <div class="card-header py-3 row">
          <div class="col-sm-3">
          <h1 class="mb-0 text-left" id="">
            <strong>Quản lý sản phẩm</strong>
          </h1>
          </div>
           <div class="col-sm-9 text-right">
               <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i></a> 
          </div>
        </div>
         	<c:if test="${error!=null }">
                 <div class="alert alert-danger" role="alert">
						 ${error}
				</div>
				</c:if>
				<c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
				  	${mess}
				</div>
				</c:if>
				
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-hover text-nowrap">
              <thead>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Name</th>
                  <th scope="col">Image</th>
                  <th scope="col">Price</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${listP}" var="o">
                <tr>
                   <td>${o.id}</td>
                    <td>${o.name}</td>
                     <td>
                          <img src="${o.image}">
                    </td>
                     <td>${o.price} $</td>
                      <td>
                              <c:if test = "${o.tinhTrang == 1}">
                                   <a href="loadProduct?pid=${o.id}"><button type="button" class="btn btn-warning"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button></a>
                                   <a href="delete?pid=${o.id}"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>
                              </c:if>
                                <c:if test = "${o.tinhTrang != 1}">
                                    <p>Ngừng kinh doanh!</p>
                                   <a href="edit?id=${o.id}&change=tt"><button type="button" class="btn btn-danger">Khôi Phục</button></a>
                              </c:if>
                      </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            <form action="xuatExcelProductControl" method="get"> 
                <button type="submit" class="mb-0 text-center btn btn-primary btn-export">Xuất file Excel</button> 
            </form> 
            <div class="clearfix">
                    <ul class="pagination">
                    <c:if test="${tag != 1}">
                    	 	<li class="page-item"><a href="manager?index=${tag-1 }">Previous</a></li>
                    	   </c:if> 	
                    	<c:forEach begin="1" end="${endPage }" var="i">
	                        <li class="${tag==i?"page-item active":"" }"><a href="manager?index=${i }" class="page-link">${i }</a></li>  
                    	 </c:forEach>
                    	 	 <li class="page-item"><a href="manager?index=${tag+1 }" class="page-link">Next</a></li>
                    </ul>
                </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</main>
 
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình 1</label>
                                <input name="image" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình 2</label>
                                <input name="image2" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình 3</label>
                                <input name="image3" type="text" class="form-control" >
                            </div>
                              <div class="form-group">
                                <label>Hình 4</label>
                                <input name="image4" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Mức giá</label>
                                <input name="price" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Tiêu đề</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                             <div class="form-group">
                                <label>Mẫu mã</label>
                                <input name="model" type="text" class="form-control" >
                            </div>
                             <div class="form-group">
                                <label>Màu sắc</label>
                                <input name="color" type="text" class="form-control" >
                            </div>
                             <div class="form-group">
                                <label>Phân phối</label>
                                <input name="delivery" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="description" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">  
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <style>
            /* Tô đậm các chữ form thêm sp */
        label {
        font-weight: bold;
            font-size:20px;
        }
        </style>
</body>
</html>