package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

/*@WebServlet(urlPatterns = "*.do", initParams = "configFile")*/
public class ControlTower extends HttpServlet {

    // <커맨드, 핸들러인스턴스> 매핑 정보 저장
	//ControllerUsingURI.properties에 적혀 있는 명령과 핸들러를 연결(ex. join.do => JoinHandler)
    private Map<String, CommandHandler> commandHandlerMap = 
    		new HashMap<>();

    public void init() throws ServletException {
        String configFile = getInitParameter("configFile");
        Properties prop = new Properties();
        String configFilePath = getServletContext().getRealPath(configFile);
        try (FileReader fis = new FileReader(configFilePath)) {
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String handlerClassName = prop.getProperty(command);
            try {
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
                commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
            		| IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
    }
    //.do가 get, post로 들어오든 process 메소드 실행
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }
    
    //요청된 명령이 어떤 .do인지 확인해서 해당 핸들러의 객체 생성하여 그 객체의 process 메소드 실행
    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI();
		//어떤 .do인지 확인
		if (command.indexOf(request.getContextPath()) == 0) {
			System.out.println("command / request.getRequestURI() >>>>> "+ command);
//			System.out.println("request.getContextPath() >>>>> "+ request.getContextPath());
			command = command.substring(request.getContextPath().length());
		}
		//예를 들어 join.do이면 join.do에 해당하는 핸들러 객체 생성
        CommandHandler handler = commandHandlerMap.get(command);
        if (handler == null) {
            handler = new NullHandler();
        }
        String viewPage = null;
        try {
        	//요청(.do)을 처리하기 위한 핸들러의 process 메소드 실행하고 반환받은 jsp 경로로 request 객체를 넘긴다
        	//ex) join.do => JoinHandler의 process 메소드 실행하고 이동 경로 받아옴
            viewPage = handler.process(request, response);
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        if (viewPage != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
    }
}
