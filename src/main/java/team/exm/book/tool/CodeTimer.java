package team.exm.book.tool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import team.exm.book.mapper.CodeMapper;
import team.exm.book.service.CodeTimerService;

public class CodeTimer extends Thread {
    private static Logger log = LoggerFactory.getLogger(CodeTimerService.class);
    private int codeId;/*需要定时删除的code数据的主键*/
    private boolean stop = false;/*调用函数传参设置true时线程安全退出*/

    CodeMapper cm;

    public CodeMapper getCm() {
        return cm;
    }

    public void setCm(CodeMapper cm) {
        this.cm = cm;
    }

    public int getCodeId() {
        return codeId;
    }

    public void setCodeId(int codeId) {
        this.codeId = codeId;
    }

    public boolean isStop() {
        return stop;
    }

    public void setStop(boolean stop) {
        this.stop = stop;
    }

    @Override
    public void run() {
        int count = 120;
        while (count-- != 0) {
            //log.info("-------------------" + String.valueOf(count));
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (stop) {
                log.info("线程以正常退出");
                break;
            }
        }
        if (cm == null) {
            log.info("cm is null");
        }
        cm.deleteByPrimaryKey(codeId);
        log.info("验证码成功删除");
    }
}
