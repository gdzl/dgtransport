package com.paxonpilot.dgtransport.service;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.paxonpilot.dgtransport.entity.AnnexDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paxonpilot.dgtransport.dao.CarDao;
import com.paxonpilot.dgtransport.dao.EmployeeDao;
import com.paxonpilot.dgtransport.dao.EnterpriceDao;
import com.paxonpilot.dgtransport.dao.TaskDao;
import com.paxonpilot.dgtransport.entity.Car;
import com.paxonpilot.dgtransport.entity.Task;
@Service("taskSerivce")
public class TaskServiceImpl implements BaseService<Task> {
	
	@Autowired
	public TaskDao taskDao;

	public List<Task> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Task> getByMap(Object[] params) {
		StringBuffer sql = new StringBuffer();
		sql.append("select count(id) as total,taskState,taskName from task where taskState in(0,3,4) and entityType=? group by taskState,taskName ");
		List list = taskDao.findListByMap(sql.toString(), params);
		return list;
	}

	public List<Task> getByEntityType(Integer entityType) {
		StringBuffer sql = new StringBuffer();
		StringBuffer sql2 = new StringBuffer();
		//是否上传
		if(entityType == 1){ //企业
			sql.append("select ((select count(1) from enterprise) - count(DISTINCT e.id)),'0' as taskState,a.fileName from enterprise e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.fileName is not null group by a.fileName ");
			sql2.append("select count(DISTINCT e.id),'4' as taskState,a.fileName from enterprise e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.fileName ");
		} else if(entityType == 2){ //车辆
			sql.append("select ((select count(1) from car) - count(DISTINCT e.id)),'0' as taskState,a.fileName from car e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.fileName is not null group by a.fileName ");
			sql2.append("select count(DISTINCT e.id),'4' as taskState,a.fileName from car e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.fileName ");
		} else if(entityType == 3) { //人员
			sql.append("select ((select count(1) from employee) - count(DISTINCT e.id)),'0' as taskState,a.fileName from employee e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.fileName is not null group by a.fileName ");
			sql2.append("select count(DISTINCT e.id),'4' as taskState,a.fileName from employee e " +
					", annexdetail a where e.id=a.entityId and " +
					"a.isValidity is null and a.deadLine is not null and a.deadLine <= to_date(to_char(sysdate," +
					"'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.fileName ");
		}

		List list = taskDao.findListByMap(sql.toString(), null);

		//是否过期
//		车辆
//		select count(DISTINCT e.id),'4' as taskState,a.FILENAME from car e
//		LEFT JOIN ANNEXDETAIL a on e.ID=a.ENTITYID where
//		a.ISVALIDITY is null and a.deadline is not null and a.deadline >= to_date(to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.FILENAME;
//
//		企业：
//
//		select count(DISTINCT e.id),'4' as taskState,a.FILENAME from enterprise e
//		LEFT JOIN ANNEXDETAIL a on e.ID=a.ENTITYID where
//		a.ISVALIDITY is null and a.deadline is not null and a.deadline >= to_date(to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.FILENAME;
//
//
//		人员:
//		select count(DISTINCT e.id),'4' as taskState,a.FILENAME from employee e
//		LEFT JOIN ANNEXDETAIL a on e.ID=a.ENTITYID where
//		a.ISVALIDITY is null and a.deadline is not null and a.deadline >= to_date(to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss') group by a.FILENAME;

		List list2 = taskDao.findListByMap(sql2.toString(),null);

		list.addAll(list2);
		return list;
	}


	public void addEntity(Task entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public Task getById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateEntity(Task entity) {
		// TODO Auto-generated method stub
		
	}

	public void deleteEntity(Task entity) {
		// TODO Auto-generated method stub
		
	}
	
	public void doEnterpriseJob(){//20170105
		StringBuffer hql = new StringBuffer();
		hql.append("select ep.id,ep.epName,detail.uploadType from enterprise ep left join annexdetail detail on ep.id=detail.entityId and detail.entityType=? and detail.isvalidity is null ");
		Object[] params = new Object[]{1};
		List list = taskDao.findLincene(hql.toString(),params);
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> epLinceneMap = new HashMap<String,Integer>();
		epLinceneMap.put("道路运输经营许可证", 1);
		epLinceneMap.put("工商营业执照", 2);
		epLinceneMap.put("安全生产管理制度", 3);
		epLinceneMap.put("安全应急制度", 4);
		epLinceneMap.put("月度安全生产演练记录", 5);
		epLinceneMap.put("月度安全生产巡查记录", 6);
		epLinceneMap.put("季度安全生产巡查记录", 7);
		taskList = getFilter(list,filterMap,epLinceneMap,taskList,1,0);
		taskDao.batchSave(taskList);
	}

	public List<Task> addList (Map<String,Integer> epLinceneMap,Entry<String,Object> map,List<Task> taskList,String val,Integer entityType,Integer isDeadLine){
		Set<Entry<String, Integer>> epSet = epLinceneMap.entrySet();
		Iterator epItor = epSet.iterator();
		while(epItor.hasNext()){
			Entry<String, Integer> epMap = (Entry<String, Integer>) epItor.next();
			Task task = new Task();
			String[] keyArr = new String[]{};
			String[] valArr = new String[]{};
			if(isDeadLine==0){
				if(val.indexOf(epMap.getValue().toString())<0){
					task.setCreateTime(new Date());
					task.setTaskState(0);
					task.setEntityType(entityType);
					keyArr = map.getKey().split("/");
					task.setTaskDesc(keyArr[1]+epMap.getKey()+"未上传");
					task.setTaskName(epMap.getKey());
					task.setEntityId(Long.valueOf(keyArr[0]));
					taskList.add(task);
				}
			}else{
				if(val.indexOf(epMap.getValue().toString())>=0){
					task.setCreateTime(new Date());
					task.setEntityType(entityType);
					keyArr = map.getKey().split("/");
					Integer diff = Integer.valueOf(keyArr[3].toString());
					if(diff<0){
						task.setTaskDesc(keyArr[1]+epMap.getKey()+keyArr[2]+"已经过期");
						task.setTaskState(4);
					}else{
						task.setTaskDesc(keyArr[1]+epMap.getKey()+keyArr[2]+"即将过期");
						task.setTaskState(3);
					}
					task.setTaskName(epMap.getKey());
					task.setEntityId(Long.valueOf(keyArr[0]));
					taskList.add(task);
				}
			}
			
		}
		return taskList;
	}
	
	public void doCarJob(){//20170105
		StringBuffer hql = new StringBuffer();
		hql.append("select c.id,c.carNo,detail.uploadType from car c left join annexdetail detail on c.id=detail.entityId and detail.entityType=? and detail.isvalidity is null ");
		Object[] params = new Object[]{2};
		List carList = taskDao.findLincene(hql.toString(),params);
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> carLinceneMap = new HashMap<String,Integer>();
		carLinceneMap.put("道路运输证", 8);
		carLinceneMap.put("机动车行驶证", 9);
		carLinceneMap.put("机动车登记证书", 10);
		carLinceneMap.put("承运人责任险", 11);
		carLinceneMap.put("环保标志", 12);
		carLinceneMap.put("GPS接入证明", 13);
		carLinceneMap.put("GPS安装证明", 18);
		carLinceneMap.put("专项检测报告", 19);
		carLinceneMap.put("燃油消耗表", 20);
		taskList = getFilter(carList,filterMap,carLinceneMap,taskList,2,0);
		taskDao.batchSave(taskList);//20170104
	}
	
	public void doEmpJob(){//20170105
		StringBuffer hql = new StringBuffer();
		hql.append("select emp.id,emp.name,detail.uploadType from employee emp left join annexdetail detail on emp.id=detail.entityId and detail.entityType=? and detail.isvalidity is null ");
		Object[] params = new Object[]{3};
		List empList = taskDao.findLincene(hql.toString(),params);
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> empLinceneMap = new HashMap<String,Integer>();
		empLinceneMap.put("身份证", 14);
		empLinceneMap.put("从业资格证", 15);
		empLinceneMap.put("驾驶证", 16);
		empLinceneMap.put("劳动合同", 17);
		taskList = getFilter(empList,filterMap,empLinceneMap,taskList,3,0);
		taskDao.batchSave(taskList);
	}
	
	public List<Task> getFilter(List list,Map<String,Object> filterMap,Map<String,Integer> empLinceneMap,List<Task> taskList,Integer entityType,Integer isDeadLine){
		for(int i=0;i<list.size();i++){
			Object[] listArray = (Object[]) list.get(i);
			
			String key = "";
			if(isDeadLine==0){
				key = listArray[0].toString()+"/"+listArray[1].toString();
			}else{
				key = listArray[0].toString()+"/"+listArray[1].toString()+"/"+listArray[3].toString()+"/"+listArray[4].toString();
			}
			
			String value = listArray[2]==null?"":listArray[2].toString();
			
			if(isDeadLine==0){
				if(filterMap.containsKey(key)){
					String val = filterMap.get(key).toString();
					val +=","+value;
					filterMap.put(key, val);
				}else{
					filterMap.put(key, value);
				}
			}else{
				String[] keyArr = key.split("/");
				if(filterMap.containsKey(keyArr[0]+"/"+keyArr[1])){
					String val = filterMap.get(key).toString();
					val +=","+value;
					filterMap.put(key, val);
				}else{
					filterMap.put(key, value);
				}
			}
		}
		Set<Entry<String, Object>> set = filterMap.entrySet();
		Iterator itor = set.iterator();

		while(itor.hasNext()){
			Entry<String,Object> map = (Entry<String,Object>)itor.next();
			String val = map.getValue().toString();
			taskList = addList(empLinceneMap,map,taskList,val,entityType,isDeadLine);
		}
		List<Task> allTask = taskDao.findAll();
		for(Task task:allTask){
			String taskDesc = task.getTaskDesc();
			Iterator itors =taskList.iterator();
			boolean isTaskDone = true;
			while(itors.hasNext()){
				Task taskitor = (Task)itors.next();
				if(taskDesc.equals(taskitor.getTaskDesc())){
					itors.remove();
					isTaskDone = false;
				}
			}

			if(isTaskDone) {
				//set current task stat to be done
				taskDao.delete(task);
			}

		}
		return taskList;
	}
	
	public void doEnterpriseDeadLineJob() throws ParseException{//20170105
		StringBuffer hql = new StringBuffer();
		hql.append(" select ep.id,ep.epName,detail.uploadType,max(detail.deadLine) as deadLine ")
		   .append(" from enterprise ep inner join annexdetail detail on ep.id=detail.entityId ")
		   .append(" and detail.entityType=? and detail.deadLine is not null ")
		   .append(" and detail.isvalidity is null ")//2017
		   .append(" group by ep.id,ep.epName,detail.uploadType ");
		Object[] params = new Object[]{1};
		List list = taskDao.findLincene(hql.toString(),params);
		List<Object> objList = new ArrayList<Object>();
		Date today = new Date();
		Iterator itor = list.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		while(itor.hasNext()){
			Object[] dataArr = (Object[])itor.next();
			Integer diff = DateCompare((Date)dataArr[3],today);
			if(diff<7){
				Object[] filterArr = new Object[5];
				filterArr[0] = dataArr[0];
				filterArr[1] = dataArr[1];
				filterArr[2] = dataArr[2];
				filterArr[3] = sdf.format(sdf.parse(dataArr[3].toString()));
				filterArr[4] = diff;
				objList.add(filterArr);
			}
		}
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> epLinceneMap = new HashMap<String,Integer>();
		epLinceneMap.put("道路运输经营许可证", 1);
		epLinceneMap.put("工商营业执照", 2);
		epLinceneMap.put("安全生产管理制度", 3);
		epLinceneMap.put("安全应急制度", 4);
		taskList = getFilter(objList,filterMap,epLinceneMap,taskList,1,1);
		taskDao.batchSave(taskList);
	}
	
	public void doCarDeadLineJob() throws ParseException{//20170105
		StringBuffer hql = new StringBuffer();
		hql.append(" select ep.id,ep.epName,detail.uploadType,max(detail.deadLine) as deadLine ")
		   .append(" from enterprise ep inner join annexdetail detail on ep.id=detail.entityId ")
		   .append(" and detail.entityType=? and detail.deadLine is not null ")
		   .append(" and detail.isvalidity is null ")//2017
		   .append(" group by ep.id,ep.epName,detail.uploadType ");
		Object[] params = new Object[]{2};
		List list = taskDao.findLincene(hql.toString(),params);
		List<Object> objList = new ArrayList<Object>();
		Date today = new Date();
		Iterator itor = list.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		while(itor.hasNext()){
			Object[] dataArr = (Object[])itor.next();
			Integer diff = DateCompare((Date)dataArr[3],today);
			if(diff<7){
				Object[] filterArr = new Object[5];
				filterArr[0] = dataArr[0];
				filterArr[1] = dataArr[1];
				filterArr[2] = dataArr[2];
				filterArr[3] = sdf.format(sdf.parse(dataArr[3].toString()));
				filterArr[4] = diff;
				objList.add(filterArr);
			}
		}
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> carLinceneMap = new HashMap<String,Integer>();
		carLinceneMap.put("道路运输证", 8);
		carLinceneMap.put("机动车行驶证", 9);
		carLinceneMap.put("机动车登记证书", 10);
		carLinceneMap.put("承运人责任险", 11);
		carLinceneMap.put("环保标志", 12);
		carLinceneMap.put("GPS接入证明", 13);
		carLinceneMap.put("GPS安装证明", 18);
		carLinceneMap.put("专项检测报告", 19);
		carLinceneMap.put("燃油消耗表", 20);
		taskList = getFilter(objList,filterMap,carLinceneMap,taskList,1,1);
		taskDao.batchSave(taskList);
	}
	
	public void doEmpDeadLineJob() throws ParseException{//20170105
		StringBuffer hql = new StringBuffer();
		hql.append(" select ep.id,ep.epName,detail.uploadType,max(detail.deadLine) as deadLine ")
		   .append(" from enterprise ep inner join annexdetail detail on ep.id=detail.entityId ")
		   .append(" and detail.entityType=? and detail.deadLine is not null ")
		   .append(" and detail.isvalidity is null ")//2017
		   .append(" group by ep.id,ep.epName,detail.uploadType ");
		Object[] params = new Object[]{3};
		List list = taskDao.findLincene(hql.toString(),params);
		List<Object> objList = new ArrayList<Object>();
		Date today = new Date();
		Iterator itor = list.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		while(itor.hasNext()){
			Object[] dataArr = (Object[])itor.next();
			Integer diff = DateCompare((Date)dataArr[3],today);
			if(diff<7){
				Object[] filterArr = new Object[5];
				filterArr[0] = dataArr[0];
				filterArr[1] = dataArr[1];
				filterArr[2] = dataArr[2];
				filterArr[3] = sdf.format(sdf.parse(dataArr[3].toString()));
				filterArr[4] = diff;
				objList.add(filterArr);
			}
		}
		List<Task> taskList = new ArrayList<Task>();
		Map<String,Object> filterMap = new HashMap<String,Object>();
		Map<String,Integer> empLinceneMap = new HashMap<String,Integer>();
		empLinceneMap.put("身份证", 14);
		empLinceneMap.put("从业资格证", 15);
		empLinceneMap.put("驾驶证", 16);
		empLinceneMap.put("劳动合同", 17);
		taskList = getFilter(objList,filterMap,empLinceneMap,taskList,1,1);
		taskDao.batchSave(taskList);
	}
	
	private Integer DateCompare(Date deadLine,Date today) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		today = sdf.parse(sdf.format(today));
		deadLine = sdf.parse(sdf.format(deadLine));
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		long todayTime = cal.getTimeInMillis();
		cal.setTime(deadLine);
		long deadLineTime = cal.getTimeInMillis();
		long diff = (deadLineTime-todayTime)/(1000*3600*24);
		return Integer.valueOf(String.valueOf(diff));
	}
	

	public TaskDao getTaskDao() {
		return taskDao;
	}

	public void setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
	}


}
