package sos.services;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import sos.pojo.dto.Branch;
import sos.pojo.dto.Bus;
import sos.pojo.dto.Driver;
import sos.pojo.dto.Route;
import sos.pojo.dto.RouteStation;
import sos.pojo.dto.Station;

public class DbOperation {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction transaction = null;

	public DbOperation() {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Object saveObject(Object obj) {

		// Save any Object to Database

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(obj);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
			return null;
		} finally {
			session.close();
		}
		return true;

	}

	public Object updateObject(Object obj) {

		// Update any Object

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			session.update(obj);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
			return null;
		} finally {
			session.close();
		}
		return true;

	}

	public boolean deleteObject(Object obj) {

		// Delete any Object

		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			session.delete(obj);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public ArrayList<Object> listObjects(Criteria criteria) {

		// Return List of Object according to criteria

		ArrayList<Object> list = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			list = (ArrayList<Object>) (criteria).list();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

	public Session getSession() {
		session = factory.openSession();
		return session;
	}

	// Lists to show user to select
	public ArrayList<Object> getStationNames() {

		Criteria criteria = getSession().createCriteria(Station.class);
		ArrayList<Object> stations = listObjects(criteria);

		return stations;
	}

	public ArrayList<Object> getRouteNames() {

		Criteria criteria = getSession().createCriteria(Route.class);
		ArrayList<Object> routes = listObjects(criteria);

		return routes;
	}

	public ArrayList<Object> getRouteStationNames() {

		Criteria criteria = getSession().createCriteria(RouteStation.class);
		ArrayList<Object> routeStations = listObjects(criteria);

		return routeStations;
	}

	public ArrayList<Object> getBranchNames() {

		Criteria criteria = getSession().createCriteria(Branch.class);
		ArrayList<Object> branches = listObjects(criteria);

		return branches;
	}

	public ArrayList<Object> getBusNames() {

		Criteria criteria = getSession().createCriteria(Bus.class);
		ArrayList<Object> branches = listObjects(criteria);

		return branches;
	}

	public ArrayList<Object> getDriverNames() {

		Criteria criteria = getSession().createCriteria(Driver.class);
		ArrayList<Object> branches = listObjects(criteria);

		return branches;
	}
}
