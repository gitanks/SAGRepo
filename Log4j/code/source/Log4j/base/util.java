package Log4j.base;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2017-02-22 14:03:58 EST
// -----( ON-HOST: PTGHP450-AM

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.io.File;
import java.net.URI;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;
import org.apache.logging.log4j.core.config.*;
// --- <<IS-END-IMPORTS>> ---

public final class util

{
	// ---( internal utility methods )---

	final static util _instance = new util();

	static util _newInstance() { return new util(); }

	static util _cast(Object o) { return (util)o; }

	// ---( server methods )---




	public static final void logDetails (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logDetails)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [i] field:0:required logLevel
		// [i] field:0:required callingServiceName
		// [i] field:0:optional transactionId
		// [i] field:0:optional corelationId
		/***
		**** Name:         logDetails
		**** Purpose:      Write a log4j log message of Any level severity
		****               server log file.
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
			String	logLevel = IDataUtil.getString( pipelineCursor, "logLevel" );
			String	callingServiceName = IDataUtil.getString( pipelineCursor, "callingServiceName" );
			String	transactionId = IDataUtil.getString( pipelineCursor, "transactionId" );
			String	corelationId = IDataUtil.getString( pipelineCursor, "corelationId" );
		pipelineCursor.destroy();
		String output = "";
		if(callingServiceName != null)
			output = output + callingServiceName + ":";
		if(transactionId != null)
			output = output +transactionId  + ":";
		if(corelationId != null)
			output = output + corelationId + ":";
		logMessage = output + logMessage;
		Logger loggerObj = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		
		if ("ERROR".equalsIgnoreCase(logLevel))
				loggerObj.error("{}",logMessage);
		else if ("DEBUG".equalsIgnoreCase(logLevel))
				loggerObj.debug("{}",logMessage);
		else if ("INFO".equalsIgnoreCase(logLevel))
				loggerObj.info("{}",logMessage);
		else if ("WARN".equalsIgnoreCase(logLevel))
				loggerObj.warn("{}",logMessage);
		
		//always destroy cursors
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void logStartup (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logStartup)>> ---
		// @sigtype java 3.5
		// [i] field:0:required filePath
		// [o] field:0:required response
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		String response = "";	
		try{
			
			// pipeline
			IDataCursor pipelineCursor = pipeline.getCursor();
				String	filePath = IDataUtil.getString( pipelineCursor, "filePath" );
			pipelineCursor.destroy();
			String configLocation = filePath;
			String name = "log4j2.xml";
			File file = new File(configLocation);
			
			LoggerContext loggerContext = org.apache.logging.log4j.core.config.Configurator.initialize(name,null, file.toURI() );
		
			//loggerContext.setConfigLocation(file.toURI());
			
			loggerContext.stop();
			//loggerContext.reconfigure();
			loggerContext.start();
		
			
			response = "Successfully configured loggers";
			IDataUtil.put( pipelineCursor_1, "response", response );
		}catch(Exception ex){
			response = "Failed to configure loggers: " + ex.toString();
			IDataUtil.put( pipelineCursor_1, "response", response );
		}finally{
			pipelineCursor_1.destroy();
		}
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
  

	
	// --- <<IS-END-SHARED>> ---
}

