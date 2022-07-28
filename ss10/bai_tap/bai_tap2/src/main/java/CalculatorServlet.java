import model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "")
public class CalculatorServlet extends HttpServlet {
    private Calculator calculate = new Calculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("first-operand"));
        double secondOperand = Double.parseDouble(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");
        double result = 0;
        String error = null;
        try {
            result = calculate.calculate(firstOperand, secondOperand, operator);
        }catch (ArithmeticException m){
            error = m.getMessage();
        }
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        if (error != null) {
            request.setAttribute("error", error);
        }else {
            request.setAttribute("result",result);
        }
        requestDispatcher.forward(request,response);
    }
    }

