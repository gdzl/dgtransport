package com.paxonpilot.dgtransport.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.paxonpilot.dgtransport.entity.AnnexDetail;

import java.util.List;

@Repository("annexDetailDao")
public class AnnexDetailDao extends BaseDao<AnnexDetail> {
}
