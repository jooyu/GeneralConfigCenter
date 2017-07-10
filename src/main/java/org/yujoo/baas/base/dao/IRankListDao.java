package org.yujoo.baas.base.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.yujoo.baas.base.dao.support.IBaseDao;
import org.yujoo.baas.base.entity.RankList;
import org.yujoo.baas.base.entity.Resource;

@Repository
public interface IRankListDao extends IBaseDao<RankList, Integer> {

	@Modifying
	@Query(nativeQuery = true,value = "DELETE FROM tb_ranklist WHERE id = :id")
	void deleteGrant(@Param("id") Integer id);

}
