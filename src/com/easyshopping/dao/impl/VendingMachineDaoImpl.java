/*
 * 

 * 
 */
package com.easyshopping.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.easyshopping.Page;
import com.easyshopping.Pageable;
import com.easyshopping.dao.VendingMachineDao;
import com.easyshopping.entity.Vendor;

/**
 * Dao - 售货机
 * 
 * 
 * @version 1.0
 */
@Repository("vendingMachineDaoImpl")
public class VendingMachineDaoImpl extends BaseDaoImpl<Vendor, Long> implements VendingMachineDao {

	@Override
	public List<Vendor> findList(String longitude, String latitude) {
		String jpql = "from Vendor";
		TypedQuery<Vendor> query = entityManager.createQuery(jpql, Vendor.class).setFlushMode(FlushModeType.COMMIT);
		return query.getResultList();
	}

	@Override
	public Page<Vendor> findPageByCodeOrName(String searchText, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Vendor> criteriaQuery = criteriaBuilder.createQuery(Vendor.class);
		Root<Vendor> root = criteriaQuery.from(Vendor.class);
		criteriaQuery.select(root);
		if(searchText!=null&&!searchText.equals("")){
			Predicate condition1 = criteriaBuilder.like(root.get("vendor_code").as(String.class), "%"+searchText+"%");
			Predicate condition2 = criteriaBuilder.like(root.get("name").as(String.class), "%"+searchText+"%");
			Predicate condition = criteriaBuilder.or(condition1, condition2);
			return super.findPage(criteriaQuery.where(condition), pageable);
		} else {
			return super.findPage(criteriaQuery, pageable);
		}
	}

}