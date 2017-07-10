package org.yujoo.baas.base.service;

import java.util.List;

import org.yujoo.baas.base.entity.RankList;
import org.yujoo.baas.base.entity.Resource;
import org.yujoo.baas.base.service.support.IBaseService;
import org.yujoo.baas.base.vo.ZtreeView;

/**
 * <p>
 * 资源服务类
 * </p>
 *
 * @author yujoo
 * @since 2016-12-28
 */
public interface IRankListService extends IBaseService<RankList, Integer> {

//	/**
//	 * 获取角色的权限树
//	 * @param roleId
//	 * @return
//	 */
//	List<ZtreeView> tree(int roleId);

	/**
	 * 修改或者新增资源
	 * @param resource
	 */
	void saveOrUpdate(RankList rankList);
	
	/**
	 * 删除
	 */

}
