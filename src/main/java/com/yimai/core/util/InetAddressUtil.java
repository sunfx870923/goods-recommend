package com.yimai.core.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class InetAddressUtil {

	private transient static Log log = LogFactory.getLog(InetAddressUtil.class);

	/**
	 * 获取本地IP地址
	 *
	 * @throws SocketException
	 */
	public static String getLocalIP() {
		try {
			if (isWindowsOS()) {
				return InetAddress.getLocalHost().getHostAddress();
			} else {
				return getLinuxLocalIp();
			}
		} catch (Exception e) {
			log.error("获取IP异常!", e);
			return "";
		}

	}

	/**
	 * 判断操作系统是否是Windows
	 *
	 * @return
	 */
	public static boolean isWindowsOS() {
		boolean isWindowsOS = false;
		String osName = System.getProperty("os.name");
		if (osName.toLowerCase().indexOf("windows") > -1) {
			isWindowsOS = true;
		}
		return isWindowsOS;
	}

	/**
	 * 获取本地Host名称
	 */
	public static String getLocalHostName() throws UnknownHostException {
		return InetAddress.getLocalHost().getHostName();
	}

	/**
	 * 获取Linux下的IP地址
	 *
	 * @return IP地址
	 * @throws SocketException
	 */
	private static String getLinuxLocalIp() throws SocketException {
		String ip = "";
		try {
			for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
				NetworkInterface intf = en.nextElement();
				String name = intf.getName();
				if (!name.contains("docker") && !name.contains("lo")) {
					for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
						InetAddress inetAddress = enumIpAddr.nextElement();
						if (!inetAddress.isLoopbackAddress()) {
							String ipaddress = inetAddress.getHostAddress().toString();
							if (!ipaddress.contains("::") && !ipaddress.contains("0:0:")
									&& !ipaddress.contains("fe80")) {
								ip = ipaddress;
								System.out.println(ipaddress);
							}
						}
					}
				}
			}
		} catch (SocketException ex) {
			log.error("获取IP异常!", ex);
			ip = "127.0.0.1";
			ex.printStackTrace();
		}
		System.out.println("IP:" + ip);
		return ip;
	}

	public static void main(String[] args) {
		System.out.println(InetAddressUtil.getLocalIP());
	}

}
