package org.yujoo.baas.base.controller.admin.system;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yujoo.baas.base.common.JsonResult;
import org.yujoo.baas.base.controller.BaseController;
import org.yujoo.baas.base.entity.RankList;
import org.yujoo.baas.base.service.IRankListService;
import org.yujoo.baas.base.service.IRankListService;
import org.yujoo.baas.base.service.specification.SimpleSpecificationBuilder;
import org.yujoo.baas.base.service.specification.SpecificationOperator.Operator;
import org.yujoo.baas.base.vo.ZtreeView;

@Controller
@RequestMapping("/admin/ranklist")
public class RankListController extends BaseController {
	@Autowired
	private IRankListService ranklistService;
	
//	@RequestMapping("/tree/{ranklistId}")
//	@ResponseBody
//	public List<ZtreeView> tree(@PathVariable Integer ranklistId){
//		List<ZtreeView> list = ranklistService.tree(ranklistId);
//		return list;
//	}
	
	@RequestMapping("/index")
	public String index() {
		return "admin/ranklist/index";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<RankList> list() {
		SimpleSpecificationBuilder<RankList> builder = new SimpleSpecificationBuilder<RankList>();
		String searchText = request.getParameter("searchText");
		if(StringUtils.isNotBlank(searchText)){
			builder.add("name", Operator.likeAll.name(), searchText);
		}
		Page<RankList> page = ranklistService.findAll(builder.generateSpecification(),getPageRequest());
		return page;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		List<RankList> list = ranklistService.findAll();
		map.put("list", list);
		return "admin/ranklist/form";
	}
	

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable Integer id,ModelMap map) {
		RankList ranklist = ranklistService.find(id);
		map.put("ranklist", ranklist);
		
		List<RankList> list = ranklistService.findAll();
		map.put("list", list);
		return "admin/ranklist/form";
	}
	
	@RequestMapping(value= {"/edit"}, method = RequestMethod.POST)
	@ResponseBody
	public JsonResult edit(RankList ranklist,ModelMap map){
		try {
			ranklistService.saveOrUpdate(ranklist);
		} catch (Exception e) {
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult delete(@PathVariable Integer id,ModelMap map) {
		try {
			ranklistService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
}
