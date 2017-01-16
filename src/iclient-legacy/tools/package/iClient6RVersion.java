package iClient6R;
import java.io.IOException;
import java.util.Calendar;

import org.apache.tools.ant.Project;

public class iClient6RVersion {
    private Project project;
    //��ȡiClient6R�İ汾�ţ�Ϊ��λ��ǰ��λΪ��Ŀ����������������˼����£�������λΪ�������յ����ڡ�
	public String getVersion(){
		String version;
		Calendar rightNow = Calendar.getInstance();
		int mm=rightNow.get(Calendar.MONTH )+1;
		int yy=rightNow.get(Calendar.YEAR);
		int dd=rightNow.get(Calendar.DAY_OF_MONTH);
		int versionWW=(yy-2009)*12+mm+48;
		String day;
		if(dd<10){
			day="0"+String.valueOf(dd);
		}else{
			day=String.valueOf(dd);
		}
		version=String.valueOf(versionWW)+day;
//				System.out.println(version);
		return version;
	}
    public void setProject(Project proj) {
        project = proj;
    }
    public void execute() throws IOException {
       // String message = project.getProperty("ant.project.name");
       // project.log("Here is project '" + message + "'.", Project.MSG_INFO);
        project.log("iClient6R's version Number(${iClient6RVersionNum}) is:"+getVersion());
        project.setNewProperty("iClient6RVersionNum", getVersion());
    }
}
