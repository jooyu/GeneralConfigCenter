package org.yujoo.baas.base.dao;

import org.springframework.stereotype.Repository;
import org.yujoo.baas.base.dao.support.IBaseDao;
import org.yujoo.baas.base.entity.User;

@Repository
public interface IUserDao extends IBaseDao<User, Integer> {

	User findByUserName(String username);

}
