package org.yujoo.baas.base.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.yujoo.baas.base.common.CommonUtil;
import org.yujoo.baas.base.dao.IRankListDao;
import org.yujoo.baas.base.dao.IResourceDao;
import org.yujoo.baas.base.dao.support.IBaseDao;
import org.yujoo.baas.base.entity.RankList;
import org.yujoo.baas.base.entity.Resource;
import org.yujoo.baas.base.entity.Role;
import org.yujoo.baas.base.service.IRankListService;
import org.yujoo.baas.base.service.IResourceService;
import org.yujoo.baas.base.service.IRoleService;
import org.yujoo.baas.base.service.support.impl.BaseServiceImpl;
import org.yujoo.baas.base.vo.ZtreeView;

/**
 * <p>
 * 资源表 服务实现类
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Service
public class RankListServiceImpl extends BaseServiceImpl<RankList, Integer>
		implements IRankListService {

	@Autowired
	private IRankListDao rankListDao;

//	@Autowired
//	private IRoleService roleService;

	@Override
	public IBaseDao<RankList, Integer> getBaseDao() {
		return this.rankListDao;
	}

//	@Override
//	@Cacheable(value = "resourceCache", key = "'tree' + #roleId")
//	public List<ZtreeView> tree(int roleId) {
//		List<ZtreeView> resulTreeNodes = new ArrayList<ZtreeView>();
//		Role role = roleService.find(roleId);
//		Set<Resource> roleResources = role.getResources();
//		resulTreeNodes.add(new ZtreeView(0L, null, "系统菜单", true));
//		ZtreeView node;
//		Sort sort = new Sort(Direction.ASC, "parent", "id", "sort");
//		List<RankList> all = rankListDao.findAll(sort);
//		for (RankList resource : all) {
//			node = new ZtreeView();
//			node.setId(Long.valueOf(resource.getId()));
//			if (resource.getParent() == null) {
//				node.setpId(0L);
//			} else {
//				node.setpId(Long.valueOf(resource.getParent().getId()));
//			}
//			node.setName(resource.getName());
//			if (roleResources != null && roleResources.contains(resource)) {
//				node.setChecked(true);
//			}
//			resulTreeNodes.add(node);
//		}
//		return resulTreeNodes;
//	}

	@Override
//	@CacheEvict(value = "resourceCache")
	public void saveOrUpdate(RankList ranklist) {
		if(ranklist.getId() != null){
			RankList dbRankList = find(ranklist.getId());
			dbRankList.setGameId(ranklist.getGameId());
			dbRankList.setLeaderboardid(ranklist.getLeaderboardid());
			dbRankList.setLimitRows(ranklist.getLimitRows());
			dbRankList.setScorePartion(ranklist.getScorePartion());
			dbRankList.setSortRule(ranklist.getSortRule());
			dbRankList.setRedisConfig(ranklist.getRedisConfig());
			dbRankList.setMysqlConfig(ranklist.getRedisConfig());
			dbRankList.setCreateTime(CommonUtil.getNowTimeStamp());
			dbRankList.setExtend(ranklist.getExtend());
			update(dbRankList);
		}else{
			ranklist.setCreateTime(CommonUtil.getNowTimeStamp());
			save(ranklist);
		}
	}

	@Override
//	@CacheEvict(value = "resourceCache")
	public void delete(Integer id) {
		rankListDao.deleteGrant(id);
//		super.delete(id);
	}




	
}
