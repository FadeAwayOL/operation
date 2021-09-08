package cn.fade;
import java.util.Random;

public class Question {
    private int operatorNum;
    private int isFenshu;
    private String equation;
    private String[] num=null;
    private String[] ch=null;
    private int kuolocation;
    private int kuolocation2;
    private int havekuo;
    public Question() {
        this.operatorNum =1;
        this.isFenshu = 0;
        this.equation="";
        num=new String[5];
        ch=new String[4];
        kuolocation=-1;
        kuolocation2=-1;
        havekuo=0;
    }

    public void setOperatorNum() {
        int a;
        Random random=new Random();
        a=random.nextInt(4);
        if(a==0){
            operatorNum=++a;
        }else if(a==1){
            operatorNum=++a;
        }else if(a==2){
            operatorNum=++a;
        }else{
            operatorNum=++a;
        }
    }
    public void setIsFenshu(){
        Random random=new Random();
        isFenshu=random.nextInt(2);
    }
    public String setNum(){
        Random random=new Random();
        if(isFenshu==0){
            return ""+(random.nextInt(5)+1);
        }
        int a;
        int b;
        a=random.nextInt(6);
        b=random.nextInt(6);
        if(a==0){
            a++;
        }
        if(b==0){
            b+=2;
        }
        if(b==1){
            b++;
        }
        for (int i = 2; i <= (a<b?a:b); i++) {
            if(a%i==0&&b%i==0){
                a=a/i;
                b=b/i;
                i--;
            }
        }
        if(b==1){
            return ""+a;
        }
        return ""+a+"/"+b;
    }
    public void setEquation(){
        setOperatorNum();
        setIsFenshu();
        num[0]=setNum();
        for (int i = 0; i < operatorNum; i++) {
            Random random=new Random();
            int a=random.nextInt(4);
            if(a==0){
                ch[i]="+";
            }else if(a==1){
                ch[i]="-";
            }else if(a==2){
                ch[i]="×";
            }else{
                ch[i]="÷";
            }
            setIsFenshu();
            num[i+1]=setNum();
        }


        for(int i=0;i<operatorNum;i++){
            if((ch[i]=="+"||ch[i]=="-")&&(num[i].equals(num[i+1])!=true)){
                Random random=new Random();
                int a =random.nextInt(2);
                havekuo=0;
                if(a==1){
                    havekuo=1;
                }
                kuolocation=i;

            }
        }
        if(operatorNum==1){
            kuolocation=-1;
        }

        equation="";

        for (int i = 0; i < operatorNum; i++) {

            if(kuolocation==i){
                this.equation+="(";
                kuolocation2=i+1;
            }
            this.equation+=num[i];
            if(i==kuolocation2){
                this.equation+=")";
            }
            this.equation+=ch[i];
        }
        this.equation+=num[operatorNum];
        if(kuolocation2==operatorNum){
            this.equation+=")";
        }
        this.equation+="=";
    }

    public String getEquation() {

        return equation;
    }

    public String result(){
        int fenmu=1;


        if(kuolocation!=-1){

            //for (int i = kuolocation; i < operatorNum; i++) {
            int sfenmu=1;
            if(num[kuolocation].indexOf("/")==-1){
                num[kuolocation]=num[kuolocation]+"/"+1;
            }
            if(num[kuolocation+1].indexOf("/")==-1){
                num[kuolocation+1]=num[kuolocation+1]+"/"+1;
            }
            sfenmu=Integer.parseInt(num[kuolocation].substring(num[kuolocation].indexOf("/")+1))*Integer.parseInt(num[kuolocation+1].substring(num[kuolocation+1].indexOf("/")+1));
            int fenzi1=Integer.parseInt(num[kuolocation].substring(0,num[kuolocation].indexOf("/")));
            int fenmu1=Integer.parseInt(num[kuolocation].substring(num[kuolocation].indexOf("/")+1));
            fenzi1*=sfenmu/fenmu1;
            num[kuolocation]=""+fenzi1+"/"+sfenmu;
            int fenzi2=Integer.parseInt(num[kuolocation+1].substring(0,num[kuolocation+1].indexOf("/")));
            int fenmu2=Integer.parseInt(num[kuolocation+1].substring(num[kuolocation+1].indexOf("/")+1));
            fenzi2*=sfenmu/fenmu2;
            num[kuolocation+1]=""+fenzi2+"/"+sfenmu;
            if(ch[kuolocation]=="+")
                fenzi1=fenzi1+fenzi2;
            else
                fenzi1=fenzi1-fenzi2;
            num[kuolocation]=fenzi1+"/"+sfenmu;
            for (int j = kuolocation; j < operatorNum-1; j++) {
                num[j+1]=num[j+2];
                ch[j]=ch[j+1];
            }
            operatorNum--;

        }

        // }

        for (int i = 0; i < operatorNum; i++) {
            if(ch[i]=="÷"){
                if(num[i+1].indexOf("/")!=-1){
                    num[i+1]=num[i+1].substring(num[i+1].indexOf("/")+1)+"/"+num[i+1].substring(0,num[i+1].indexOf("/"));
                }else{
                    num[i+1]=1+"/"+num[i+1];
                }
                ch[i]="×";
            }
        }

        int snum[]=new int[operatorNum+1];
        for (int i = 0; i < operatorNum+1; i++) {
            if(num[i].indexOf("/")==-1){
                num[i]=""+Integer.parseInt(num[i])+"/"+1;
            }
            snum[i]=Integer.parseInt(num[i].substring(0, num[i].indexOf("/")));
        }

        for (int i = 0; i < operatorNum; i++) {
            if(ch[i].equals("×")==true){
                snum[i]=snum[i]*snum[i+1];
                num[i]=""+snum[i]+"/"+(Integer.parseInt(num[i].substring(num[i].indexOf("/")+1)))*(Integer.parseInt(num[i+1].substring(num[i+1].indexOf("/")+1)));
                for (int j = i; j < operatorNum-1; j++) {
                    snum[j+1]=snum[j+2];
                    num[j+1]=num[j+2];
                    ch[j]=ch[j+1];
                }
                i--;
                operatorNum--;
            }
        }

        for (int i=0;i<operatorNum+1;i++) {
            fenmu*=Integer.parseInt(num[i].substring(num[i].indexOf("/")+1));
        }

        for (int i = 0; i < operatorNum+1; i++) {
            int sfenmu;
            sfenmu=Integer.parseInt(num[i].substring(num[i].indexOf("/")+1));
            num[i]=""+Integer.parseInt(num[i].substring(0, num[i].indexOf("/")))*(fenmu/sfenmu)+"/"+fenmu;
        }

        for (int i = 0; i < operatorNum+1; i++) {
            snum[i]=Integer.parseInt(num[i].substring(0, num[i].indexOf("/")));
        }

        for (int i = 0; i < operatorNum; i++) {
            if(ch[i].equals("+")==true){
                snum[i]=snum[i]+snum[i+1];
                for (int j = i; j < operatorNum-1; j++) {
                    snum[j+1]=snum[j+2];
                    ch[j]=ch[j+1];
                }
                i--;
                operatorNum--;
                continue;
            }
            if(ch[i].equals("-")==true){
                snum[i]=snum[i]-snum[i+1];
                for (int j = i; j < operatorNum-1; j++) {
                    snum[j+1]=snum[j+2];
                    ch[j]=ch[j+1];
                }
                i--;
                operatorNum--;
                continue;
            }
        }

        if(snum[0]<0&&fenmu<0){
            snum[0]=-snum[0];
            fenmu=-fenmu;
        }

        if(fenmu<0&&snum[0]>0){
            snum[0]=-snum[0];
            fenmu=-fenmu;
        }
        int isfu=0;
        if(snum[0]<0){
            snum[0]=-snum[0];
            isfu=1;
        }
        for (int i=2;i<=(snum[0]>fenmu?fenmu:snum[0]);i++){
            if(snum[0]%i==0&&fenmu%i==0){
                snum[0]/=i;
                fenmu/=i;
                i--;
            }
        }

        if(snum[0]==0){
            return ""+0;
        }


        if(fenmu!=1){
            if(isfu==1)
                return "-"+snum[0]+"/"+fenmu;
            else
                return ""+snum[0]+"/"+fenmu;
        }
        if(isfu==1) {
            return "-" + snum[0];
        }
        return ""+snum[0];
    }
}
