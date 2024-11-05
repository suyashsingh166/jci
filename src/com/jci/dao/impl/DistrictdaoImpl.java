package com.jci.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jci.dao.DistrictDao;
import com.jci.model.DistrictModel;
@Transactional
@Repository

public class DistrictdaoImpl implements DistrictDao {
	@Autowired
	SessionFactory sessionFactory;
	protected Session currentSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void create(DistrictModel productlist) {
		currentSession().save(productlist);

	}

	@Override
	public void update(DistrictModel productlist) {
		currentSession().update(productlist);

	}

	@Override
	public DistrictModel edit(int id) {
		return find(id);
	}

	@Override
	public void delete(int id) {
		DistrictModel prod = new DistrictModel();
		String hql = "Delete from dbo.product where id = '"+id+"' " ;
		 this.sessionFactory.getCurrentSession().createSQLQuery(hql).executeUpdate();
		//List<String> results = query.list();

	}

	@Override
	public DistrictModel find(int id) {
		return (DistrictModel) currentSession().get(DistrictModel.class, id);
	}

	@Override
	public List<DistrictModel> getAll() {
	//	System.out.println("Hello From StateListModel");
		List<DistrictModel> ll;
		Criteria c = this.sessionFactory.getCurrentSession().createCriteria(DistrictModel.class);
		ll=c.list();
		return ll;
	}

	@Override
	public boolean submitform(DistrictModel off) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(off);
		return false;
	}
	
	@Override
	public List<String> findByDistrictId(String dids) {
		String querystr = "select district_name from tbl_districts where id in ("+dids+")";
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = session.createSQLQuery(querystr);
		List<String> rows = query.list();
		return rows;
	}

	/*
	 * @Override public List<String> getAllFilledPosition(String id) { //return
	 * productdao.getAll(); // List<ProductModel> val = new ArrayList<>(); // String
	 * sql = "select max(position) from dbo.product where menu_name='Insurance' ";
	 * // List<Map<String, Object>> rows = jdbc.queryForList(sql); // return rows;
	 * String hql = "select position from dbo.product where menu_name= '"+id+"' " ;
	 * Query query = this.sessionFactory.getCurrentSession().createSQLQuery(hql);
	 * List<String> results = query.list(); //String sql =
	 * "select max(position) from dbo.product where menu_name='Insurance'";
	 * //List<String> listsearch = jdbc.queryForList(sql, String.class); return
	 * results; }
	 */
	@Override
	public List<String> getAllFilledPosition(String state) {
		List<String> result = new ArrayList<>();
	
		String hql = "select id, district_name from tbl_districts where state_id ="+state+"";
		Query query = this.sessionFactory.getCurrentSession().createSQLQuery(hql);
		List<Object[]> rows = query.list();
		for(Object[] row : rows){
			result.add(row[0].toString()+"-"+row[1].toString());
			//System.out.println("state value from DaoImpl is      "+result);
		
		}
		return result;
	}
}