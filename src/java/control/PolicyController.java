package control;

import dal.PolicyDAO;
import model.policy;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PolicyController", urlPatterns = {"/policy/*"})
public class PolicyController extends HttpServlet {
    private PolicyDAO policyDAO;

    @Override
    public void init() throws ServletException {
        policyDAO = new PolicyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Show all policies
            getAllPolicies(request, response);
        } else if (pathInfo.equals("/add")) {
            // Show add form
            showAddForm(request, response);
        } else if (pathInfo.equals("/edit")) {
            // Show edit form
            showEditForm(request, response);
        } else if (pathInfo.equals("/delete")) {
            // Handle delete
            deletePolicy(request, response);
        } else if (pathInfo.startsWith("/view")) {
            // Show policy details
            showPolicyDetail(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Default action is add policy
            addPolicy(request, response);
        } else if (pathInfo.equals("/update")) {
            // Update policy
            updatePolicy(request, response);
        }
    }

    private void getAllPolicies(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<policy> policies = policyDAO.getAllPolicies();
        request.setAttribute("policies", policies);
        request.getRequestDispatcher("listpolicy.jsp").forward(request, response);
    }

    private void showPolicyDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getPathInfo().substring("/view".length());
            int id = Integer.parseInt(idStr);
            policy policy = policyDAO.getPolicyById(id);

            if (policy != null) {
                request.setAttribute("policy", policy);
                request.getRequestDispatcher("listpolicy.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/policy");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/policy");
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Render the list page with the Add modal
        getAllPolicies(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            policy policy = policyDAO.getPolicyById(id);

            if (policy != null) {
                request.setAttribute("policy", policy);
                request.getRequestDispatcher("list.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/policy");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/policy");
        }
    }

    private void addPolicy(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        String title = request.getParameter("title");
        String context = request.getParameter("context");

        if (title != null && !title.trim().isEmpty() && context != null && !context.isEmpty()) {
            policy newPolicy = new policy();
            newPolicy.setPolicyTitle(title.trim());
            // Store context with preserved line breaks
            newPolicy.setPolicyContext(context);

            policyDAO.addPolicy(newPolicy);
            response.sendRedirect(request.getContextPath() + "/policy");
        } else {
            request.setAttribute("error", "Title and context are required!");
            getAllPolicies(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("error", "Error adding policy: " + e.getMessage());
        getAllPolicies(request, response);
    } 
    }

    private void updatePolicy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String context = request.getParameter("context").trim();

            if (title != null && !title.trim().isEmpty() && context != null && !context.isEmpty()) {
                policy updatePolicy = new policy();
                updatePolicy.setPolicyId(id);
                updatePolicy.setPolicyTitle(title.trim());
                // Không trim() context để giữ nguyên format
                updatePolicy.setPolicyContext(context);

                policyDAO.updatePolicy(updatePolicy);
                response.sendRedirect(request.getContextPath() + "/policy");
            } else {
                request.setAttribute("error", "Title and context are required!");
                request.setAttribute("policy", policyDAO.getPolicyById(id));
                getAllPolicies(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/policy");
        }
    }

    private void deletePolicy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            policyDAO.deletePolicy(id);
        } catch (NumberFormatException e) {
            // Handle error if needed
        }
        response.sendRedirect(request.getContextPath() + "/policy");
    }
}
