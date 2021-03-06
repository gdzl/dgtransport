package com.paxonpilot.dgtransport.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Dictionary;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.entity.Role;
import com.paxonpilot.dgtransport.entity.Street;
import com.paxonpilot.dgtransport.entity.SubSystem;
import com.paxonpilot.dgtransport.entity.User;
import com.paxonpilot.dgtransport.util.Page;
import com.paxonpilot.dgtransport.util.PageUtil;

@Repository("dictionaryDao")
public class DictionaryDao extends BaseDao<Dictionary> {
}
