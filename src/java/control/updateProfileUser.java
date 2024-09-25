package control;

import dal.EmployeeDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Employee;
import model.User;

/**
 *
 * @author nhatk
 */
public class updateProfileUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            EmployeeDAO edao = new EmployeeDAO();
            UserDAO udao = new UserDAO();
            HttpSession session = request.getSession();
            List<User> listUserNotUsed = udao.getAllUserNotUsed();
            session.setAttribute("listUserNotUsed", listUserNotUsed);
            int empid = Integer.parseInt(request.getParameter("empid"));
            Employee e = edao.getEmployeeByID(empid);
            User u = udao.getUserByEmpID(empid);
            request.setAttribute("currentUser", u);
            request.setAttribute("employee", e);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
        } catch (Exception e) {
            out.print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            UserDAO udao = new UserDAO();
            EmployeeDAO edao = new EmployeeDAO();
            HttpSession session = request.getSession();
            Employee emp = new Employee();
                int empid = Integer.parseInt(request.getParameter("empid"));
            emp.setEmpID(empid);
            Employee oldEmployee = edao.getEmployeeByID(empid);
            String oldIdentification = oldEmployee.getIdentification();
            String newIdentification = request.getParameter("identification");// new information

            String Name = request.getParameter("name");
            emp.setName(Name);
            String DateOfBirth = request.getParameter("birthday");
            emp.setDateOfBirth(DateOfBirth);
            int Sex = Integer.parseInt(request.getParameter("sex"));
            emp.setSex(Sex);
            String Address = request.getParameter("address");
            emp.setAddress(Address);
            String Phone = request.getParameter("phone");
            emp.setPhone(Phone);
            String Identification = request.getParameter("identification");
            emp.setIdentification(Identification);
            String StartDate = request.getParameter("startdate");
            emp.setStartDate(StartDate);
            int Salary = Integer.parseInt(request.getParameter("salary"));
            emp.setSalary(Salary);
            int userID = Integer.parseInt(request.getParameter("userID"));
            emp.setUserID(userID);

            List<Employee> listEmployee = edao.getAllEmployee();
            for (Employee e : listEmployee) {
                if (!newIdentification.equals(oldIdentification)) {
                    if (e.getIdentification().equals(newIdentification)) {
                        // check if username is existed in database and different from old name
                        request.setAttribute("noti", "Identification " + newIdentification + " existed, please enter again!");
                        request.setAttribute("employee", oldEmployee);
                        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                        return;
                    }
                }
            }
            edao.editEmployee(emp);
            request.setAttribute("noti", "Save successful!");

            request.setAttribute("employee", emp);
            User u = udao.getUserByEmpID(empid);
            request.setAttribute("currentUser", u);
            List<User> listUserNotUsed = udao.getAllUserNotUsed();
            session.setAttribute("listUserNotUsed", listUserNotUsed);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);

        } catch (Exception e) {
            out.print(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}