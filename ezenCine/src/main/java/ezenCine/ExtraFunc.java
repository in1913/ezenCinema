package ezenCine;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class ExtraFunc {
	public static String getDateWithoutDash(String date) {
		if(date == null) {
			return null;
		}else {
			String result = date.substring(0, 4) // year 
					+ date.substring(5, 7)  // month
					+ date.substring(8, 10) // day
					+ date.substring(11, 13) // hour
					+ date.substring(14, 16) // minute
					+ date.substring(17);
			return result;
		}
	}
	
	public static String getdayDiffer(String Date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		Date currentTime = new Date();
		String today = format.format(currentTime);
		String getDate = getDateWithoutDash(Date);
		Date todays = null;
		Date getDates = null;
		try {
			todays = format.parse(today);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			getDates = format.parse(getDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long diff = todays.getTime() - getDates.getTime();
		
		TimeUnit time = TimeUnit.DAYS;
		
		long difference = time.convert(diff, TimeUnit.MILLISECONDS);
		
		return Long.toString(difference);
		
	}
}
