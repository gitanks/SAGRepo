package Shweta.EDI_POC;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2017-01-03 16:08:18 EST
// -----( ON-HOST: drv1sxai02.dnet.domtar

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.lang.*;
import java.util.*;
// --- <<IS-END-IMPORTS>> ---

public final class utils

{
	// ---( internal utility methods )---

	final static utils _instance = new utils();

	static utils _newInstance() { return new utils(); }

	static utils _cast(Object o) { return (utils)o; }

	// ---( server methods )---



    public static final Values appendSegment (Values in)
    {
        Values out = in;
		// --- <<IS-START(appendSegment)>> ---
		// @subtype unknown
		// [i] record:0:required record
		// [i] record:1:required recordList
		// [o] record:1:required recordList
		Values rec = in.getValues("record");
		if (rec == null)
			return out.copyFrom(Service.throwError("Missing required parameter: {record}"));
		Values[] dest = in.getValuesArray("recordList");
		if (dest == null)
			dest = new Values[0];
		Values[] src = new Values[1];
		src[0] = rec;
		Values tmp[] = new Values[dest.length + src.length];
		System.arraycopy(dest,0,tmp,0,dest.length);
		System.arraycopy(src,0,tmp,dest.length,src.length);
		out.put("recordList",tmp);
		// --- <<IS-END>> ---
        return out;
                
	}
}

