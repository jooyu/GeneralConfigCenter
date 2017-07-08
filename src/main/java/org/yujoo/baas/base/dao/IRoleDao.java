package org.yujoo.baas.base.dao;

import org.springframework.stereotype.Repository;
import org.yujoo.baas.base.dao.support.IBaseDao;
import org.yujoo.baas.base.entity.Role;

@Repository
public interface IRoleDao extends IBaseDao<Role, Integer> {

}
