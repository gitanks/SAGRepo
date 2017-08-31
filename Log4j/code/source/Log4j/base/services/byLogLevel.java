package Log4j.base.services;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.util.*;
import java.io.*;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Level;
// --- <<IS-END-IMPORTS>> ---

public final class byLogLevel

{
	// ---( internal utility methods )---

	final static byLogLevel _instance = new byLogLevel();

	static byLogLevel _newInstance() { return new byLogLevel(); }

	static byLogLevel _cast(Object o) { return (byLogLevel)o; }

	// ---( server methods )---




	public static final void logDebug (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logDebug)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [o] field:0:required status
		/***
		**** Name:         logDebug
		**** Purpose:      Write a log4j log message of "DEBUG" level severity 
		****               server log file.
		 
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
		pipelineCursor.destroy();		
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		logger.debug("local Host"+":"+"5555"+" " +logMessage);
		
		 
		//always destroy cursors
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void logError (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logError)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [o] field:0:required status
		/***
		**** Name:         logError
		**** Purpose:      Write a log4j log message of "ERROR" level severity
		****               server log file.
		
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
		pipelineCursor.destroy();
		
		// input
		
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		String strLevel = logger.getLevel().toString();
		logger.error("localHos"+":"+"5555"+ logMessage+strLevel);
		
		
		//always destroy cursors
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void logFatal (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logFatal)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [o] field:0:required status
		/***
		**** Name:         logFatal
		**** Purpose:      Write a log4j log message of "FATAL" level severity
		****               server log file.
		
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
		pipelineCursor.destroy();
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		logger.fatal("localHost"+":"+"55555"+" " +logMessage);
		
		
		//always destroy cursors
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void logInfo (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logInfo)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [o] field:0:required status
		/***
		**** Name:         logInfo
		**** Purpose:      Write a log4j log message of "INFO" level severity
		****               server log file.
		
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
		pipelineCursor.destroy();
		
		
		
		try
		{
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		logger.info("localhost"+":"+"5555"+" " +logMessage);
		
		
		}catch( Exception e){ throw new ServiceException(e);}
		//always destroy cursors
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void logLevel (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logLevel)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [o] field:0:required loggingLevel
		/***
		**** Name:         logError
		**** Purpose:      Write a log4j log message of "ERROR" level severity
		****               server log file.
		
		***/
		 
		//Retrieve input parameters from the pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
		pipelineCursor.destroy();
		boolean loggerNameFlag=false;
		// input
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		String strLevel = logger.getLevel().toString();
		//logger.error("localHos"+":"+"5555"+ strLevel+"::::"+loggerNameFlag);
		// pipeline
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor_1, "loggingLevel", strLevel );
		
		
		pipelineCursor_1.destroy();
		
		
			
		// --- <<IS-END>> ---

                
	}



	public static final void logWarning (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(logWarning)>> ---
		// @sigtype java 3.5
		// [i] field:0:required loggerName
		// [i] field:0:required logMessage
		// [o] field:0:required status
		/***
		**** Name:         logWarning
		**** Purpose:      Write a log4j log message of "WARNING" level severity
		****               server log file.
		
		***/
		
		//Retrieve input parameters from the pipeline
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	loggerName = IDataUtil.getString( pipelineCursor, "loggerName" );
			String	logMessage = IDataUtil.getString( pipelineCursor, "logMessage" );
		pipelineCursor.destroy();
		
		// input
		IData input = IDataFactory.create();
		
		// output
		IData 	output = IDataFactory.create();
		
		
		
		Logger logger = org.apache.logging.log4j.LogManager.getLogger(loggerName);
		logger.warn("localhost"+":"+"5555"+" " +logMessage);
		
		
		//always destroy cursors
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---

	
	// --- <<IS-END-SHARED>> ---
}

