package com.neusoft.common;

/**
 * @describe
 * m1:生成序列
 * @author smartxia
 * @version 2017-8-5 下午4:24:57
 *
 */
import java.text.SimpleDateFormat;
import java.util.Date;

import com.neusoft.service.Impl.OrderListServiceImpl;

public class Methondxia {
	/**
	 * 对序列号按照日期类的增加 1.首先从数据库查询出已有的最大编号 2.拼NO+当前时间格式的字符串
	 * 3.判断最大编号是否存在，最大编号中是否包含当天时间 4.如果最大编号不存在，则直接生成第一个编号NO201601270001
	 * 5.如果最大编号存在且包涵当天时间，则给最大编号加1，拼成编码.
	 * 
	 * @author xiapf 2017-8-5
	 * @return String 类型 编号
	 */
	public String sequence() {
		String Orderno = null;
		// 如何获取带最大值
/*		INewsDaoImpl test = new INewsDaoImpl();*/
		/*OrderListServiceImpl oi=new OrderListServiceImpl();
		int a= oi.maxwater(); */
		// 从数据库查询出的最大编号
		String maxOrderno = "201709230000";
		// System.out.println("最大编号:" + maxOrderno);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); // 时间字符串产生方式
		String uid_pfix =  format.format(date); // 组合流水号前一部分，NO+时间字符串，如：NO20160126
		System.out.println(uid_pfix);
		if (maxOrderno != null && maxOrderno.contains(uid_pfix)) {
			System.out.println(maxOrderno);
			String uid_end = maxOrderno.substring(8, 12); // 截取字符串最后四位，从第10开始结果:0001
			System.out.println("uid_end=" + uid_end);
			int endNum = Integer.parseInt(uid_end); // 把String类型的0001转化为int类型的1
			// System.out.println("endNum=" + endNum);
			int tmpNum = 10000 + endNum + 1; // 结果10002
			// System.out.println("tmpNum=" + tmpNum);
			Orderno = uid_pfix + this.subStr("" + tmpNum, 1);
			// 把10002首位的1去掉，再拼成NO201601260002字符串
			//
		} else {
			Orderno = uid_pfix + "0001";
		}
		return Orderno;

	}

	/**
	 * 意思极限是9999 然后就得从头来
	 * 
	 * @author xiapf 2017-8-5
	 * @param str
	 *            ：后四位
	 * @param start
	 *            ：1
	 * @return "" 代表 10002 的1 调用subStr() 方法的时候给return ""掉了
	 */
	public String subStr(String str, int start) {
		{
			if (str == null || str.equals("") || str.length() == 0)
				return "";
			if (start < str.length()) {
				return str.substring(start);
			} else {
				return "";
			}

		}

	}

}