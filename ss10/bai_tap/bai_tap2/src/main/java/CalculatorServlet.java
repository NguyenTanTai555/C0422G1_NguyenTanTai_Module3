import service.Calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    private Calculator calculator = new Calculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/calculator.jsp");
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
            result = calculator.calculate(firstOperand, secondOperand, operator);
        }catch (ArithmeticException a){
            error = a.getMessage();
        }
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/calculator.jsp");
        if (error != null) {
            request.setAttribute("error", error);
        }else {
            request.setAttribute("result",result);
        }
        requestDispatcher.forward(request,response);
    }
    }

